class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :list, null: false
      t.belongs_to :user, null: false
      t.string :due_date
    end
  end
end
