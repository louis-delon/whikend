require "administrate/base_dashboard"

class HikeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    trips: Field::HasMany,
    id: Field::Number,
    duration: Field::String,
    location: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    distance: Field::String,
    asc_elevation: Field::String,
    desc_elevation: Field::String,
    alt_min: Field::String,
    alt_max: Field::String,
    difficulty: Field::String,
    hike_type: Field::Boolean,
    description: Field::Text,
    department: Field::String,
    photo: Field::String,
    title: Field::String,
    link: Field::String,
    photo_url: Field::String,
    site_id: Field::Number,
    coordinates: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :trips,
    :id,
    :duration,
    :location,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :trips,
    :id,
    :duration,
    :location,
    :created_at,
    :updated_at,
    :distance,
    :asc_elevation,
    :desc_elevation,
    :alt_min,
    :alt_max,
    :difficulty,
    :hike_type,
    :description,
    :department,
    :photo,
    :title,
    :link,
    :photo_url,
    :site_id,
    :coordinates,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :trips,
    :duration,
    :location,
    :distance,
    :asc_elevation,
    :desc_elevation,
    :alt_min,
    :alt_max,
    :difficulty,
    :hike_type,
    :description,
    :department,
    :photo,
    :title,
    :link,
    :photo_url,
    :site_id,
    :coordinates,
  ].freeze

  # Overwrite this method to customize how hikes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(hike)
  #   "Hike ##{hike.id}"
  # end
end
