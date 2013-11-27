require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the person view', type: :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  describe 'email addresses' do
    before(:each) do
      person.email_addresses.create(address: "boo@ex.com")
      person.email_addresses.create(address: "radly@ex.com")
      visit person_path(person)
    end

    it 'shows the email addresses' do
      person.email_addresses.each do |email|
        expect(page).to have_selector('li', text: email.address)
      end
    end

    it 'has an add email address link' do
      expect(current_path).to eq(person_path(person))
      click_on('new_email_address')
      expect(current_path).to eq(new_email_address_path)
    end

    it 'adds a new email address' do
      page.click_link('Add email address')
      page.fill_in('Address', with: "boo@ex.com")
      page.click_button('Create Email address')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('boo@ex.com')
    end

  end

  describe 'phone numbers' do
    before(:each) do
      person.phone_numbers.create(number: "555-1234")
      person.phone_numbers.create(number: "555-5678")
      visit person_path(person)
    end

    it 'shows the phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(person_id: person.id))
    end

    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Create Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-8888')
    end

    it 'has links to edit phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = person.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_button('Update Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-9191')
      expect(page).to_not have_content(old_number)
    end

    it 'deletes a phone number' do
      phone = person.phone_numbers.first
      first(:link, 'delete').click
      expect(page).to_not have_content(phone.number)
    end
  end

end
