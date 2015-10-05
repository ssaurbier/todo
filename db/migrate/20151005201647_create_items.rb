class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :lists, null: false
      t.belongs_to :users, null: false
      t.string :due_date
    end
  end
end
