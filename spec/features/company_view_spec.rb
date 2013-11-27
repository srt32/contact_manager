require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the company view', type: :feature do
  let(:company) { Company.create(name: 'Acme Corp') }

  describe 'email addresses' do
    if false
    before(:each) do
      company.email_addresses.create(address: "boo@ex.com")
      company.email_addresses.create(address: "radly@ex.com")
      visit company_path(company)
    end
    end

    it 'shows the email addresses' do
      pending
      company.email_addresses.each do |email|
        expect(page).to have_selector('li', text: email.address)
      end
    end

    it 'has an add email address link' do
      pending
      expect(current_path).to eq(company_path(company))
      click_on('new_email_address')
      expect(current_path).to eq(new_email_address_path)
    end

    it 'adds a new email address' do
      pending
      page.click_link('Add email address')
      page.fill_in('Address', with: "boo@ex.com")
      page.click_button('Create Email address')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('boo@ex.com')
    end

    it 'has links to edit email addresses' do
      pending
      company.email_addresses.each do |email|
        expect(page).to have_link('edit', href: edit_email_address_path(email))
      end
    end

    it 'edits an email address' do
      pending
      email_address = company.email_addresses.first
      old_address = email_address.address

      first(:link, 'edit').click
      page.fill_in('Address', with: 'yargh@ex.com')
      page.click_button('Update Email address')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('yargh@ex.com')
      expect(page).to_not have_content(old_address)
    end

    it 'has links to delete email addresses' do
      pending
      company.email_addresses.each do |email|
        expect(page).to have_link('delete', href: email_address_path(email))
      end
    end

    it 'deletes an email address' do
      pending
      email_address = company.email_addresses.first
      first(:link, 'delete').click
      expect(current_path).to eq(company_path(company))
      expect(page).to_not have_content(email_address.address)
    end

  end

  describe 'phone numbers' do
    before(:each) do
      company.phone_numbers.create(number: "555-1234")
      company.phone_numbers.create(number: "555-5678")
      visit company_path(company)
    end

    it 'shows the phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
    end

    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Create Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-8888')
    end

    it 'has links to edit phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = company.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_button('Update Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-9191')
      expect(page).to_not have_content(old_number)
    end

    it 'deletes a phone number' do
      phone = company.phone_numbers.first
      first(:link, 'delete').click
      expect(page).to_not have_content(phone.number)
    end
  end

end
