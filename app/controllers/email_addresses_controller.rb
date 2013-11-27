class EmailAddressesController < ApplicationController
  before_action :set_email_address, only: [:show, :edit, :update, :destroy]

  # GET /email_addresses
  # GET /email_addresses.json
  def index
    @email_addresses = EmailAddress.all
  end

  # GET /email_addresses/1
  # GET /email_addresses/1.json
  def show
  end

  # GET /email_addresses/new
  def new
    @email_address = EmailAddress.new(person_id: params[:person_id])
  end

  # GET /email_addresses/1/edit
  def edit
  end

  # POST /email_addresses
  # POST /email_addresses.json
  def create
    @email_address = EmailAddress.new(email_address_params)

    respond_to do |format|
      if @email_address.save
        format.html { redirect_to @email_address.person, notice: 'Email address was successfully created.' }
        format.json { render action: 'show', status: :created, location: @email_address }
      else
        format.html { render action: 'new' }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_addresses/1
  # PATCH/PUT /email_addresses/1.json
  def update
    respond_to do |format|
      if @email_address.update(email_address_params)
        format.html { redirect_to @email_address.person, notice: 'Email address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_addresses/1
  # DELETE /email_addresses/1.json
  def destroy
    @email_address.destroy
    respond_to do |format|
      format.html { redirect_to @email_address.person }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_address
      @email_address = EmailAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_address_params
      params.require(:email_address).permit(:address, :person_id)
    end
end
