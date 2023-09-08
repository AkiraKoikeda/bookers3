class Public::BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

