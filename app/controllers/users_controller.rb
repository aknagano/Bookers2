class UsersController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
    
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to user_path(current_user.id)
  end
    
    @user = User.find(params[:id])
  end
  

  
  def update
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to user_path(current_user.id)
  end
    
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
    @users = User.all
    flash.now[:notice] = "error"
    render :edit
    end
  end
  
  private
  
  def user_params
   params.require(:user).permit(:name, :email, :password, :introduction, :profile_image)
  end
  
end
