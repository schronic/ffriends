class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :friends
  has_many :purchases

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # mount_uploader :picture, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
