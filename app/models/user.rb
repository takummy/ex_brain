class User < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :books, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
end