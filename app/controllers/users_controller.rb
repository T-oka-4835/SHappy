class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    # @events = Event.where(user_id: @user.id)
    # @event = Event.new
  end

  def show
    @user = User.find(params[:id])
    @stresses = @user.stresses
    # @stresses = Stress.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phonenumber, :profile_image)
  end

end
