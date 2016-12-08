class User < ActiveRecord::Base
  has_many :shots
  has_many :games
  has_many :ships

  has_secure_password
  validates :username, :email, presence: true
end
