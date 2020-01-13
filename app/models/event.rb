class Event < ApplicationRecord
  belongs_to :user
  belongs_to :contact
  
  enum icon: [ :fa-comments, :fa-calendar-day, :fa-question-circle, :fa-phone-squareactive ]
end
