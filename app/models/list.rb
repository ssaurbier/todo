class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :user_id, presence: true

def today
  Date.today
end

def tomorrow
  Date.tomorrow
end

def next_day
  Date.tomorrow + 1
end

end
