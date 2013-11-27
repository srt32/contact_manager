require 'spec_helper'

describe EmailAddress do
  let(:email_address) { EmailAddress.new(address: "boom@example.com", person_id: 1) }

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'in invalid without an address' do
    email_address.address = nil
    expect(email_address).to_not be_valid
  end

  it 'must have a reference to a person' do
    email_address.person_id = nil
    expect(email_address).to_not be_valid
  end

end
