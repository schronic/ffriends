class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :purchase

  validates :slogan, presence: true
  validates :price, presence: true
  validates :user_id, presence: true

  mount_uploader :picture, PhotoUploader

end
