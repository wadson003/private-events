class AttendancesController < ApplicationController
  Before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])

    unless @event.attendees.include?(current_user)
      @event.attendees << current_user
      Flash[:notice] = "Vous etes inscrit a cet evenement !"
    else
      Flash[:alert] = "Vous participez deja a cet evenement."
    end

    redirect_to @event
  end
end
