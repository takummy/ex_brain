class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @books = current_user.books.page(params[:page])
                               .order_by_created_at
  end
end
