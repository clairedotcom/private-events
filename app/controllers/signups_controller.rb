class SignupsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @event = Event.find(params[:id])
    current_user.attended_events << @event
  end
end
