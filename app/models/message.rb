class Message < ApplicationRecord
  belongs_to :trip
  belongs_to :user
end
