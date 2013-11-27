class EmailAddress < ActiveRecord::Base
  validates :address, presence: true
  belongs_to :person
end
