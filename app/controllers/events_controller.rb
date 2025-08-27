class EventsController < ApplicationController

  def index
    # commenter pour tester la localisation
    # @events = Event.where(tags: params[:tags])
    @events = Event.all
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
  end
end
