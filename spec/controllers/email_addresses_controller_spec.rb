require 'spec_helper'

describe EmailAddressesController do

  let(:eve) { Person.create("first_name" => "Eve", "last_name" => "Sauce") }
  let(:valid_attributes) { { "address" => "MyString", "person_id" => eve.id } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all email_addresses as @email_addresses" do
      email_address = EmailAddress.create! valid_attributes
      get :index, {}, valid_session
      assigns(:email_addresses).should eq([email_address])
    end
  end

  describe "GET show" do
    it "assigns the requested email_address as @email_address" do
      email_address = EmailAddress.create! valid_attributes
      get :show, {:id => email_address.to_param}, valid_session
      assigns(:email_address).should eq(email_address)
    end
  end

  describe "GET new" do
    it "assigns a new email_address as @email_address" do
      get :new, {}, valid_session
      assigns(:email_address).should be_a_new(EmailAddress)
    end
  end

  describe "GET edit" do
    it "assigns the requested email_address as @email_address" do
      email_address = EmailAddress.create! valid_attributes
      get :edit, {:id => email_address.to_param}, valid_session
      assigns(:email_address).should eq(email_address)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EmailAddress" do
        expect {
          post :create, {:email_address => valid_attributes}, valid_session
        }.to change(EmailAddress, :count).by(1)
      end

      it "assigns a newly created email_address as @email_address" do
        post :create, {:email_address => valid_attributes}, valid_session
        assigns(:email_address).should be_a(EmailAddress)
        assigns(:email_address).should be_persisted
      end

      it "redirects to the created email addresses' person" do
        post :create, {:email_address => valid_attributes}, valid_session
        response.should redirect_to(eve)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved email_address as @email_address" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmailAddress.any_instance.stub(:save).and_return(false)
        post :create, {:email_address => { "address" => "invalid value" }}, valid_session
        assigns(:email_address).should be_a_new(EmailAddress)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmailAddress.any_instance.stub(:save).and_return(false)
        post :create, {:email_address => { "address" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested email_address" do
        email_address = EmailAddress.create! valid_attributes
        # Assuming there are no other email_addresses in the database, this
        # specifies that the EmailAddress created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EmailAddress.any_instance.should_receive(:update).with({ "address" => "MyString" })
        put :update, {:id => email_address.to_param, :email_address => { "address" => "MyString" }}, valid_session
      end

      it "assigns the requested email_address as @email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => valid_attributes}, valid_session
        assigns(:email_address).should eq(email_address)
      end

      it "redirects to the email_address's person" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => valid_attributes}, valid_session
        response.should redirect_to(eve)
      end
    end

    describe "with invalid params" do
      it "assigns the email_address as @email_address" do
        email_address = EmailAddress.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmailAddress.any_instance.stub(:save).and_return(false)
        put :update, {:id => email_address.to_param, :email_address => { "address" => "invalid value" }}, valid_session
        assigns(:email_address).should eq(email_address)
      end

      it "re-renders the 'edit' template" do
        email_address = EmailAddress.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmailAddress.any_instance.stub(:save).and_return(false)
        put :update, {:id => email_address.to_param, :email_address => { "address" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested email_address" do
      email_address = EmailAddress.create! valid_attributes
      expect {
        delete :destroy, {:id => email_address.to_param}, valid_session
      }.to change(EmailAddress, :count).by(-1)
    end

    it "redirects to the email_addresses list" do
      email_address = EmailAddress.create! valid_attributes
      delete :destroy, {:id => email_address.to_param}, valid_session
      response.should redirect_to(email_addresses_url)
    end
  end

end
