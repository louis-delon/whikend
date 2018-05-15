class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates  :trip, presence: true
  validates  :user, presence: true
end
