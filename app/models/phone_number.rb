class PhoneNumber < ActiveRecord::Base
  validates :number, :person_id, presence: true
  belongs_to :person
end
