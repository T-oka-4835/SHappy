class EventsController < ApplicationController
  before_action :authenticate_user!
  def create
     @event = Event.new(event_params)
     @event.user_id = current_user.id
     @event.save!
     redirect_to stresses_path
     @events = Event.where(user_id: current_user.id)
  end

  def update
     @event = Event.find(params[:id])
     @events = Event.where(user_id: current_user.id)
     @event.updaet(event_params)
     redirect_to stresses_path
  end

  def destroy
    @user = User.find(params[:id])
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to stresses_path
  end

  private
  def event_params
    params.require(:event).permit(:user_id, :title, :start, :end, :body)
  end

end
