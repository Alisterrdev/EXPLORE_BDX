class EventsController < ApplicationController

  def index
    @events = Event.where(tags: params[:tags])

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event: event}),
        marker_html: render_to_string(partial: "marker")
      }
    end

  end

  def new
  end

  def create
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.where(tags: @event.tags)
    # @favorite = Favorite.new
  end
end
