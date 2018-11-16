class Arena < ApplicationRecord
  has_many :fights
  has_many :friends, through: :fights
  validates :name, presence: true, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :picture, PhotoUploader

  LEVEL = [0, 1, 2, 3, 4, 5]
  validates :level, inclusion: { in: LEVEL }
end
