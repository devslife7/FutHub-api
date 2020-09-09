class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  has_many :user_leagues
  has_many :leagues, :through => :user_leagues
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :user_watchparties, :dependent => :destroy
  has_many :watchparties, :through => :user_watchparties
  has_many :user_invitations, :dependent => :destroy
  has_many :invitations, :through => :user_invitations

  validates :name, presence: true
  validates :password, presence: true, :on => :create
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
