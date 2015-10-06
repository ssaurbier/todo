class Item < ActiveRecord::Base
  validates :list, presence: true
  validates :user, presence: true
  belongs_to :list
  belongs_to :user


end
