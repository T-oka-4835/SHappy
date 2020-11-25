class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @stress = Stress.find(params[:stress_id])
    favorite = @stress.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @stress = Stress.find(params[:stress_id])
    favorite = @stress.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end
