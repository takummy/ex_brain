class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

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

  def show;end

  def edit;end

  def update
    if @book.update(book_params)
      flash[:success] = '編集しました'
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:info] = "#{@book.title}を削除しました"
    redirect_to user_path(@book.user)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :image)
  end
end