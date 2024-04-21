class BooksController < ApplicationController
  def new
   @books = Book.new
  end

  def index
    @books = Book.page(params[:page])
  end

  def create
    @books = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else 
      render '/books'
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
