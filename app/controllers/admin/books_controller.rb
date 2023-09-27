class Admin::BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to admin_books_path
    else
      render show
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to admin_book_path(@book)
    else
      render edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
