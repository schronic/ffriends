class Fight < ApplicationRecord
  belongs_to :arena
  belongs_to :fight

  validates :name, presence: true, uniqueness: true
  validates :date, presence: true, uniqueness: true
end


