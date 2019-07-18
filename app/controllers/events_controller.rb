class EventsController < ApplicationController
  before_action :get_event , only: [:show, :new, :update]
  before_action :authenticated!, only: [:update, :create]
  def index
    @events = Event.all

  end

  def show
    @event = Event.find(params[:id])
  end

  def new

  end

  def create
    @event = current_user.events.build(event_params)
    @event.save
    flash.now[:success] = 'event successfully created'
    redirect_to user_path(@event.creator_id)
  end

  def update

    if  @event.attendees << current_user
      flash[:success] = "You are now attending this event"
      redirect_to '/'
    end

  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
   def get_event
     @event = Event.find(params[:id])
   end
end
