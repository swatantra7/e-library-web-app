class Admin::BooksController < ApplicationController

  before_action :find_book, only: [:show, :edit, :update]

  def index
    @books = Book.all.order(updated_at: :desc)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      respond_to do |format|
        format.js
      end
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update_attribute(book_params)
      redirect_to books_path
      flash[:notice] = 'Book Updated Successfully'
    else
     redirect_to books_path
      flash[:alert] = 'Book Not Updated'
    end
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(
      :book_name,
      :price,
      :payable,
      :status,
      :subject_id
    )
  end

end
