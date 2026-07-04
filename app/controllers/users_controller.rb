class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events

    @upcoming_events = @user.attended_events.upcoming
    @past_events = @user.attended_events.past
  end
end
