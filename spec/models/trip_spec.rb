require "rails_helper"

RSpec.describe Trip, :type => :model do

  context 'comment association'
  it 'should validate a trip belongs to user' do
    trip = Trip.new
    expect(trip).to belong_to(:user)
  end

  context 'comment association'
  it 'should validate a trip belongs to hike' do
    trip = Trip.new
    expect(trip).to belong_to(:hike)
  end

  context 'comment association'
  it 'should validate a trip has many reviews' do
    trip = Trip.new
    expect(trip).to have_many(:reviews)
  end

  context 'comment association'
  it 'should validate a trip has many reviews' do
    trip = Trip.new
    expect(trip).to have_many(:messages)
  end

  context 'comment association'
  it 'should validate a trip has many reviews' do
    trip = Trip.new
    expect(trip).to have_many(:users)
  end

  context 'comment association'
  it 'should validate a trip has many reviews' do
    trip = Trip.new
    expect(trip).to have_many(:submissions)
  end

  context 'validation'
  it 'should validate presence of date' do
    trip = Trip.new
    trip.date = "26/12/2018"
    trip.validate
    expect(trip.errors.)
    expect(trip.date.valid?).to be true
  end


end
