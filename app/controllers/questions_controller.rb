class QuestionsController < ApplicationController
  before_action :authenticate_user!

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

  private

  def question_params
    params.require(:question).permit(
      :content,
      answers_attributes: [:id, :content, :correct]
    )
  end
end