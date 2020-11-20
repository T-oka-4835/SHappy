class FavoritesController < ApplicationController
  def create
    stress = Stress.find(params[:stress_id])
    favorite = current_user.favorites.new(stress_id: stress.id)
    favorite.save
    redirect_to stress_path(stress)
  end

  def destroy
    stress = Stress.find(params[:stress_id])
    favorite = current_user.favorites.find_by(stress_id: stress.id)
    favorite.destroy
    redirect_to stress_path(stress)
  end
end
