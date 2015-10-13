class Item < ActiveRecord::Base
  belongs_to :list
  validates :list_id, presence: true
  validates :name, presence: true

  def date
    if @item.due_date = Date.today
      return 'Today'
    elsif @item.due_date = Date.tomorrow
      return 'Tomorrow'
    else @item.due_date = Date.tomorrow + 1
      return 'Day After Tomorrow'
    end
  end


end
