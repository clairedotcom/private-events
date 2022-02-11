class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
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
