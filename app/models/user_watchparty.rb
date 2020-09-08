class UserWatchparty < ApplicationRecord
  belongs_to :user
  belongs_to :watchparty
end
