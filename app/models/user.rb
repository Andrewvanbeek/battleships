class User < ActiveRecord::Base
  has_many :shots
  has_many :ships
  has_many :games

  has_secure_password
end
