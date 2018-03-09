require "rails_helper"

RSpec.describe Trip, :type => :model do
  it 'trip belongs to user' do
    trip = Trip.new
    expect(trip).to belong_to(:user)
  end
end
