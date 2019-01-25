class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :lesson_questions
end
