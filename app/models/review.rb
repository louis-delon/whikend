class Review < ApplicationRecord
  belongs_to :trip
  belongs_to :sender, foreign_key: "sender_id", class_name: "User"
  belongs_to :receiver, foreign_key: "receiver_id", class_name: "User"
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :sender, presence: true
  validates :receiver, presence: true
  validates :trip, presence: true
end
