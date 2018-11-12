class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :purchase

  validates :slogan, presence: true, uniqueness: true
  validates :age, presence: true
  validates :price
  mount_uploader :photo, PhotoUploader
end
