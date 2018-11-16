class Fight < ApplicationRecord
  belongs_to :arena
  belongs_to :friend

  validates :name, presence: true
end


