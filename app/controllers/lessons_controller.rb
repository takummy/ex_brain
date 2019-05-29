class LessonsController < ApplicationController
  before_action :authenticate_user!

  def create
    @lesson = current_user.lessons.build(lesson_params)
    if @lesson.save
      flash[:success] = "問題を開始します"
      redirect_to new_lesson_lesson_question_path(@lesson)
    else
      root_path
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    if lesson.destroy
      flash[:info] = "前回の成績を削除しました"
      redirect_to current_user
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:book_id)
  end
end