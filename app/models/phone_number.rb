class PhoneNumber < ActiveRecord::Base
  validates :number, presence: true
end
