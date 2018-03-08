require "administrate/base_dashboard"

class ReviewDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    trip: Field::BelongsTo,
    sender: Field::BelongsTo.with_options(class_name: "User"),
    receiver: Field::BelongsTo.with_options(class_name: "User"),
    id: Field::Number,
    rating: Field::Number,
    content: Field::Text,
    sender_id: Field::Number,
    receiver_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :trip,
    :sender,
    :receiver,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :trip,
    :sender,
    :receiver,
    :id,
    :rating,
    :content,
    :sender_id,
    :receiver_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :trip,
    :sender,
    :receiver,
    :rating,
    :content,
    :sender_id,
    :receiver_id,
  ].freeze

  # Overwrite this method to customize how reviews are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(review)
  #   "Review ##{review.id}"
  # end
end
