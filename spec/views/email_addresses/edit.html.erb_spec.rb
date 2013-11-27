require 'spec_helper'

describe "email_addresses/edit" do
  before(:each) do
    @email_address = assign(:email_address, stub_model(EmailAddress,
      :address => "MyString",
      :person_id => 1
    ))
  end

  it "renders the edit email_address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", email_address_path(@email_address), "post" do
      assert_select "input#email_address_address[name=?]", "email_address[address]"
      assert_select "input#email_address_person_id[name=?]", "email_address[person_id]"
    end
  end
end
