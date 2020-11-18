class StressesController < ApplicationController

  def index
    @stresses = Stress.all
  end

  def show
    @stress = Stress.find(params[:id])
  end

  def new
    @stress = Stress.new
  end

  def create
    @stress = Stress.new(stress_params)
    @stress.user_id = current_user.id
    @stress.save
    redirect_to stress_path(@stress)
  end

  def edit
    @stress = Stress.find(params[:id])
  end

  def update
    @stress = Stress.find(params[:id])
    @stress.user_id = current_user.id
    @stress.update(stress_params)
    redirect_to stress_path(@stress)
  end

  def destroy
  end

  private
  def stress_params
    params.require(:stress).permit(:user, :title, :body)
  end
end
