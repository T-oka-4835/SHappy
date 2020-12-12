class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @stresses = @user.stresses.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
    flash[:delete] = 'お使い頂いて、ありがとうございました！'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phonenumber, :profile_image)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to users_path
    end
  end

end
