class Contact < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
end
