require 'spec_helper'

describe "email_addresses/index" do
  before(:each) do
    assign(:email_addresses, [
      stub_model(EmailAddress,
        :address => "Address",
        :person_id => 1
      ),
      stub_model(EmailAddress,
        :address => "Address",
        :person_id => 1
      )
    ])
  end

  it "renders a list of email_addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
