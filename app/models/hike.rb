class Hike < ApplicationRecord
  has_many :trips
  has_many :checkpoints
end
