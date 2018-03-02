class Hike < ApplicationRecord
  serialize :coordinates

  has_many :trips, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
