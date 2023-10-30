class AddEditedToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :edited, :boolean, null: false, default: false
  end
end
