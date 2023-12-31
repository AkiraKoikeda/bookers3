class Public::BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      render show
    end
  end

  def update
    @book = Book.find(params[:id])
    unless user == current_user
      redirect_to book_path(@book)
    end
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def edit
    @book = Book.find(params[:id])
    user = @book.user
    unless user == current_user
      redirect_to book_path(@book)
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

