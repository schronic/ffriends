class Purchase < ApplicationRecord
  belongs_to :user

  validates :total_price, presence: true
  validates :user_id, presence: true
end
