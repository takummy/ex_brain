class Book < ApplicationRecord
  belongs_to :user

  has_many :questions, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates :title, presence: true, length:{ maximum: 50 }
  validates :description, presence: true, length:{ maximum: 150 }

  mount_uploader :image, ImageUploader
end
