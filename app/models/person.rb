class Person < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  has_many :phone_numbers, as: :contact
  has_many :email_addresses
end
