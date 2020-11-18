class StressesController < ApplicationController

  def index
    @stresses = Stress.all
  end

  def show
  end

  def new
    @stress = Stress.new
  end

  def create
    @stress = Stress.new(stress_params)
    @stress.user_id = current_user.id
    @stress.save!
    redirect_to stresses_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def stress_params
    params.require(:stress).permit(:user, :title, :body)
  end
end
