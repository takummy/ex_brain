class Answer < ApplicationRecord
  belongs_to :question

  has_many :lesson_questions, dependent: :destroy

  validates :content, presence: true, length: { maximum: 200 }
end
