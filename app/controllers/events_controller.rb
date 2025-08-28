class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    #double filtre commenter en attendant d'améliorer tags(table??)
    events_filtered_by_tag = Event.where(tags: params[:tags])
    #events_filtered_by_mood = Event.where(tags: params[:tags])
    #events_filtered_by_tag = events_filtered_by_mood .where(tags: params[:budget])
    #http://[::1]:3000/events?location=20&start_date=2025-08-29&end_date=2025-08-31
    events_filtered_by_date = Event.where 
    if current_user
      @events = events_filtered_by_tag.near(current_user.address, params[:location].to_i)
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
