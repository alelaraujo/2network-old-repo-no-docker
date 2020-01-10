class Interaction < ApplicationRecord
  belongs_to :user
  belongs_to :contacts
  has_many :contacts
  has_many :types
end
