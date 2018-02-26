class AddcolumnsToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :content, :string
    add_column :submissions, :accepted, :boolean
    add_reference :submissions, :user, foreign_key: true
  end
end
