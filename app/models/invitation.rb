class Invitation < ApplicationRecord
  has_many :user_invitations, :dependent => :destroy
  has_many :users, :through => :user_invitations
end
