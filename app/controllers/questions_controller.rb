class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i(edit update)

  def new
    @book = Book.find(params[:book_id])
    @question = @book.questions.build
    3.times { @question.answers.build }
  end

  def create
    @book = Book.find(params[:book_id])
    @question = @book.questions.build(question_params)

    if @question.save
      flash[:success] = "問題を作成しました"
      redirect_to @book
    else
      render :new
    end
  end

  def edit;end

  def update
    if @question.update(question_params)
      flash[:info] = "問題を更新しました"
      redirect_to @question.book
    else
      render :edit
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(
      :content,
      answers_attributes: %i(id content correct)
    )
  end
end