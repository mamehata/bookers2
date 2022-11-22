class BooksController < ApplicationController
  def index
    @booker = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @book_id = Book.find(params[:id])
    @booker = @book_id.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
