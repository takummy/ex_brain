class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :lesson_questions, dependent: :destroy
  has_many :questions, through: :lesson_questions, dependent: :destroy
  has_many :answers, through: :lesson_questions, dependent: :destroy
end