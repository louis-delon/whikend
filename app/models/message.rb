class Message < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  
  validates :content, presence: true
  validates :user, presence: true
  validates :trip, presence: true
end
