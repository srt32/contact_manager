require 'spec_helper'

describe Person do
  let(:person) do
    Person.new(first_name: 'Alice', last_name: 'Smith')
  end

  it 'is valid' do
    person.first_name = nil
    expect(person).to_not be_valid
  end

  it 'is invalid without a first name' do
    person.last_name = nil
    expect(person).to_not be_valid
  end

  it 'is invalid without a last name' do
    person = Person.new(first_name: 'Bob', last_name: nil)
    expect(person).not_to be_valid
  end

end
