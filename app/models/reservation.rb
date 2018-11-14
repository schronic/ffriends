class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :friend
  # only allow each user to have a single reservation for
  # a friend (i.e. friend only in cart once)
  validates :friend_id, uniqueness: { scope: [:user_id] }
end
