require 'spec_helper'

describe Company do
  let(:company) { Company.new(name: "Acme") }

  it 'is valid' do
    expect(company).to be_valid
  end

  it 'is not valid without a name' do
    company.name = nil
    expect(company).to_not be_valid
  end

end
