class Hike < ApplicationRecord
  has_many :trips
  has_many :checkpoints
  mount_uploader :photo, PhotoUploader
end
