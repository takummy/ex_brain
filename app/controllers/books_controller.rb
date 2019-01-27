class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = '本を追加しました'
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @book = Book.find[:params]
  end



  private
  def book_params
    params.require(:book).permit(:title, :description, :image)
  end
end