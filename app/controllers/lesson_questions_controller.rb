class LessonQuestionsController < ApplicationController
  before_action :authenticate_user!

  def new
    lesson = Lesson.find(params[:lesson_id])
    book = lesson.book
    @question = (book.questions - lesson.questions).first
    @choices = @question.answers
  end

  def create
    lesson = Lesson.find(params[:lesson_id])
    lesson_question = lesson.lesson_questions.build(question_id: params[:question_id],
                                                    answer_id: params[:answer_id])

    if lesson_question.save
      next_or_result(lesson)
    end
  end

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_questions = @lesson.lesson_questions
    @result = @lesson.answers.map { |answer| answer.correct || nil }.compact.count
  end

  private
  def has_next_question?(lesson)
    book = lesson.book
    questions = book.questions
    answered_questions = lesson.questions
    next_questions = questions - answered_questions
    next_questions.any?
  end

  def next_or_result(lesson)
    respond_to do |format|
      if has_next_question?(lesson)
        book = lesson.book
        @question = (book.questions - lesson.questions).first
        @choices = @question.answers
        format.js { render :create }
      else
        format.html { redirect_to lesson_lesson_questions_path(lesson),
                      notice: "解答を保存しました。" }
      end
    end
  end
end