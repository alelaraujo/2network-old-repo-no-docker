class ContactInfo < ApplicationRecord
  belongs_to :contact
  has_many :types
end
