class Hike < ApplicationRecord
  has_many :trips, dependent: :destroy
  has_many :checkpoints, dependent: :destroy

  # mount_uploader :photo, PhotoUploader
end
