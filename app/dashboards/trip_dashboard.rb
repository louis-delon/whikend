require "administrate/base_dashboard"

class TripDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    hike: Field::BelongsTo,
    reviews: Field::HasMany,
    messages: Field::HasMany,
    submissions: Field::HasMany,
    users: Field::HasMany,
    id: Field::Number,
    date: Field::DateTime,
    start_location: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    seats: Field::Number,
    auto_accept: Field::Boolean,
    title: Field::String,
    trip_type: Field::String,
    fees: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :hike,
    :reviews,
    :messages,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :hike,
    :reviews,
    :messages,
    :submissions,
    :users,
    :id,
    :date,
    :start_location,
    :description,
    :created_at,
    :updated_at,
    :seats,
    :auto_accept,
    :title,
    :trip_type,
    :fees,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :hike,
    :reviews,
    :messages,
    :submissions,
    :users,
    :date,
    :start_location,
    :description,
    :seats,
    :auto_accept,
    :title,
    :trip_type,
    :fees,
  ].freeze

  # Overwrite this method to customize how trips are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(trip)
  #   "Trip ##{trip.id}"
  # end
end
