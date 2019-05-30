class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: %i(show edit update destroy)
  before_action :require_correct_owner, only: %i(show edit update destroy)

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = "#{t('book.added')}"
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show;end

  def edit;end

  def update
    if @book.update(book_params)
      flash[:success] = "#{t('book.edited')}"
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:info] = "#{@book.title}#{t('book.deleted')}"
    redirect_to user_path(@book.user)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :image)
  end

  def require_correct_owner
    book = Book.find(params[:id])
    unless current_user.id == book.user_id
      flash[:danger] = "アクセスできません"
      redirect_to root_path
    end
  end
end