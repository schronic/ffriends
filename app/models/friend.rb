class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :purchase

  validates :slogan, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :rating, inclusion: { in: %w(0,1,2,3,4,5)}

  mount_uploader :picture, PhotoUploader

end
