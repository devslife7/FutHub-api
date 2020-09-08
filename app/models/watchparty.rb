class Watchparty < ApplicationRecord
  has_many :user_watchparties, :dependent => :destroy
  has_many :users, :through => :user_watchparties
end
