class AddUpdate < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :edited, :string, null: false, default: "false"
    add_column :reviews, :edited, :string, null: false, default: "false"
  end
end
