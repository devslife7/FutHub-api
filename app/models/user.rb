class User < ApplicationRecord
  has_secure_password

  has_many :user_leagues
  has_many :leagues, :through => :user_leagues
  has_many :friendships
  has_many :friends, :through => :friendships

  validates :name, presence: true
  validates :password, presence: true, :on => :create
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
