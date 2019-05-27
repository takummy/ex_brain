class LessonQuestion < ApplicationRecord
  belongs_to :lesson
  belongs_to :question
  belongs_to :answer
end