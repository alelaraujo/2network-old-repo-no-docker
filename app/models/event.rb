class Event < ApplicationRecord
  # belongs_to :user
  belongs_to :contact
  belongs_to :type
  belongs_to :user

  
end
