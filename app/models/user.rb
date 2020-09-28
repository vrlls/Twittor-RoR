class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_many :tweets, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  

  def find_username(id)
    user=User.find(id)
    @username = user.username
  end
end
