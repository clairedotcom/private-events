class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def attend
    @event = Event.find(params[:id])
    @signup = Signup.new(attended_event_id: @event.id, attendee_id: current_user.id)

    if @signup.save
      redirect_to @event, notice: 'Sign Up Successful'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description)
  end
end
