class Lessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :semester, null: false
      t.string :day, null: false
      t.string :time , null: false
      t.string :course, null: false
      t.string :title, null: false
      t.string :teacher, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
