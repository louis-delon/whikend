class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :hike
  has_many :reviews
  has_many :messages
  has_many :submissions
  has_many :users, through: :submissions
  validates :date, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :hike, presence: true
end
