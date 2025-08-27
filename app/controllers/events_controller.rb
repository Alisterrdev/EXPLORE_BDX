class EventsController < ApplicationController

  def index
    @events = Event.where(tags: params[:tags])

  end

  def new
  end

  def create
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.where(tags: @event.tags)
  end
end
