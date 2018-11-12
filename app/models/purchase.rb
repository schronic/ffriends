class Purchase < ApplicationRecord
  belongs_to :user

  validates :total_price, presence: true
  validates :confirmation_number, presence: true, uniqueness: true
  validates :user_id, presence: true
end
