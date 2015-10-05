class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.string :due_date
    end
  end
end
