class Interaction < ApplicationRecord
  belongs_to :user
  has_many :contacts
  has_many :types
end
