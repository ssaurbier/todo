class ChangeItemDuedateToDate < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE items ALTER due_date TYPE date USING (due_date::date)'
  end
  def down
    execute 'ALTER TABLE items ALTER due_date TYPE date USING (due_date::string)'
  end
end
