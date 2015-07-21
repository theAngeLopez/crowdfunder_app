class UsersController < ApplicationController
  def show
    @user = User.find(paramd[:id])
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
      if @user.save
        redirect_to products_url, notice: "Signed up!"
      else
        render "new"
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to projects_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
