class BooksController < ApplicationController
  def index
    @booker = current_user
    @book_new = Book.new
    @books = Book.all
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @booker = @book.user
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_new.id)
    else
      @booker = current_user
      @books = Book.all
      render 'books/index'
    end
  end

  def edit
    @book_new = Book.new
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render 'books/edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
