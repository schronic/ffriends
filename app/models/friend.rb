class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :purchase, optional: true

  validates :slogan, presence: true
  validates_length_of :slogan, maximum: 80
  validates :price, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5]}

  mount_uploader :picture, PhotoUploader
end
