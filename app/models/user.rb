class User < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :books, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable

  mount_uploader :icon, IconUploader
end
