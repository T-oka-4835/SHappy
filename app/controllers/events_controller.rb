class EventsController < ApplicationController
  def create
     @event = Event.new(event_params)
     @event.user_id = current_user.id
     @event.save!
     @events = Event.where(user_id: current_user.id)
  end

  def update
     @event = Event.find(params[:id])
     @events = Event.where(user_id: current_user.id)
     @event.updaet(event_params)
  end

  def destroy
    @user = User.find(params[:id])
    @event = Event.find(params[:id])
    event.destroy
    redirect_to user_path(@user)
  end

  private
  def event_params
    params.require(:event).permit(:user_id, :title, :start, :end, :body)
  end

end
