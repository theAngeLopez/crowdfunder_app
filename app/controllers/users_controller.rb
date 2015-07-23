class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
      if @user.save
        auto_login(@user)
        redirect_back_or_to projects_url, notice: "Signed up!"
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
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
