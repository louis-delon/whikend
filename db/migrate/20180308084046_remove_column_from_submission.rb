class RemoveColumnFromSubmission < ActiveRecord::Migration[5.1]
  def change
    remove_column :submissions, :content
  end
end
