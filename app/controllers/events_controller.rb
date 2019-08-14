class EventsController < ApplicationController
  def new
  	unless logged_in?
  		flash[:danger] = 'You must be connected to create a new event !'
  		redirect_to login_path
  	end
  	@event = Event.new
  end

  def create
  	@event = Event.new(params_event)
    @event.description = params_event[:description]
    @event.place = params_event[:place]
    @event.date = params_event[:date]
    @event.creator = current_user
   

    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def show
  	 @event = Event.find(params[:id])
  end

  def index
  	 @event = Event.all
  end

  def subscribe
  	@event = Event.find(params[:id])

    if 
    	@event.attendees.include? current_user
    	flash[:danger] = "You already participate to this event !" 
    	redirect_to @event
    else
    	@event.attendees << current_user
    	flash[:success] = "You successfully subscribed to this event !" 
    	redirect_to @event
		end
  end

  def invite
    @event = Event.find(params[:id])
    @event_id << user_id
  end

  private

  def params_event

      params.require(:event).permit(:description, :place, :date, :creator_id)
  	
  end
end
