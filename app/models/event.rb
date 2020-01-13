class Event < ApplicationRecord
  belongs_to :user
  belongs_to :contact
  has_many :types
end
