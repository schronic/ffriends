class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :purchase, optional: true

  validates :slogan, presence: true
  validates :price, presence: true
  validates :user_id, presence: true

  mount_uploader :picture, PhotoUploader

end
