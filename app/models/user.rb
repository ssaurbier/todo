class User < ActiveRecord::Base
  has_many :lists


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true

  def admin?
    user_type == "admin"
  end

  def full_phone_number
    "+1#{phone_number}"
  end
end
