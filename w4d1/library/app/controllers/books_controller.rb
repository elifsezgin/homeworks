class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    Book.create(book_params)

    redirect_to action: :index
  end

  def destroy
    Book.find_by(id: params[:id]).destroy

    redirect_to action: :index
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
