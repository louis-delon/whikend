class AddTripToSubmission < ActiveRecord::Migration[5.1]
  def change
    add_reference :submissions, :trip, foreign_key: true
  end
end
