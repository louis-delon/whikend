class Trip < ApplicationRecord
  include PgSearch
  belongs_to :user
  belongs_to :hike
  has_many :reviews
  has_many :messages
  has_many :submissions
  validates :date, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :hike, presence: true

  pg_search_scope :global_search,
  against: [ :start_location, :description  ],
  associated_against: {
    hike: [ :department, :description ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
