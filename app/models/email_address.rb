class EmailAddress < ActiveRecord::Base
  validates :address, :person_id, presence: true
  belongs_to :person
end
