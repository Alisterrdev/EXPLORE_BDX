class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    events_filtered_by_tag = Event.where(tags: params[:tags])
    if current_user
      @events = events_filtered_by_tag.near(current_user.address, 10)
    else
      @events = events_filtered_by_tag
    end

    @user_marker = [{
        lat: current_user.latitude,
        lng: current_user.longitude
    }]

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event: event}),
        marker_html: render_to_string(partial: "marker"),

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
