class Question < ApplicationRecord
  belongs_to :book

  has_many :answers, dependent: :destroy
  has_many :lesson_questions, dependent: :destroys

  accepts_nested_attributes_for :answers

  validates :content, presence: true, length: { maximum: 200 }
end
