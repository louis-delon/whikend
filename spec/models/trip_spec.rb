require "rails_helper"

RSpec.describe Trip, :type => :model do
  it { expect(Trip.new).to belong_to(:user) }
end
