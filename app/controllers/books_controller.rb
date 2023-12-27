class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def edit
   @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@book.id)
    else
       @books = Book.all
       flash.now[:notice] = "error"
       render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def show
    @books =Book.find(params[:id])
    @book = Book.new
    @user = @books.user
  end
  
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
    @books = Book.all
    flash.now[:notice] = "error"
    render :index
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  

end
