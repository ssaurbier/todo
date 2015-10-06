class User < ActiveRecord::Base
has_many :lists

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true

  def admin?
    user_type == "admin"
  end
end
