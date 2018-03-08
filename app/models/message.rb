class Message < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  validates :content, length: { minimum: 2 }
  validates :user, presence: true
  validates :trip, presence: true
end
