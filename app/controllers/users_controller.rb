class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_correct_user, only: :show

  def show
    @user = User.find(params[:id])
    @books = current_user.books.page(params[:page])
                               .order_by_created_at
    @lesson = Lesson.new
  end
end
