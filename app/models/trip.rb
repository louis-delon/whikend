class Trip < ApplicationRecord
  include PgSearch

  belongs_to :user
  belongs_to :hike

  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :users, through: :submissions, dependent: :destroy

  validates :date, presence: true
  validates :start_location, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :hike_id, presence: true
  validates :trip_type, presence: true
  validates :title, presence: true
  validates :seats, presence: true
  validates :fees, presence: true
  validates_inclusion_of :auto_accept, in: [true, false]

  pg_search_scope :global_search,
  against: [ :start_location, :description, :title ],
  associated_against: {
    hike: [ :department, :description, :title, :location ]
  },
  using: {
    tsearch: { prefix: true }
  }

  def self.categories
    ["Chill", "Heavy walk", "Challenge", "Leisure", "Activities"]
  end
end
