class Event < ApplicationRecord
  # belongs_to :user
  belongs_to :contact
  belongs_to :type
  belongs_to :user

  validates :note, presence: true
  validates :type_id, presence: true
end
