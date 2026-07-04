class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def show
   @event = Event.find(params[:id])
  end

  def new
   @event = current_user.created_events.build
  end

  def create
   @event = current_user.created_events.build(event_params)

   if @event.save
    redirect_to @event, notice: "Evenement cree avec succes !"
   else
    Render :new, status: :unprocessable_entity
   end
  end

  private

  def event_params
  params.require(:event).permit(:location, :date)
  end
end
