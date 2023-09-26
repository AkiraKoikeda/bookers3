class Admin::BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  private

  def book_params
    params.repuire(:book).permit(:title, :body)
  end
end
