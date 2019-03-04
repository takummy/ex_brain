class Question < ApplicationRecord
  belongs_to :book

  has_many :answers, dependent: :destroy
  has_many :lesson_questions, dependent: :destroy

  accepts_nested_attributes_for :answers

  validates :content, presence: true, length: { maximum: 200 }
  validate :has_one_correct_answer

  private

  def has_one_correct_answer
    if answers.map { |answer| answer.correct? || nil }.compact.count > 1
      errors.add(:answers, "は一つ以上選択できません")
    elsif answers.map { |answer| answer.correct? || nil }.compact.count == 0
      errors.add(:answers, "を一つ選んでください")
    end
  end
end