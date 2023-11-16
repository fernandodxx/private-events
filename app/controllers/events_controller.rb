class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy]
  skip_before_action :authorize, only: %i[ index show]
  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def show
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy

    redirect_to root_path, status: :see_other
  end

  private 

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :image_url, :date)
    end
end
