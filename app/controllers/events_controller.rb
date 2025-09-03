class EventsController < ApplicationController
  before_action :authenticate_user!

  def index

    #double filtre commenter en attendant d'améliorer tags(table??)
    events_filtered_by_tag = Event.where(tags: params[:tags])
    #events_filtered_by_mood = Event.where(tags: params[:tags])
    #events_filtered_by_tag = events_filtered_by_mood .where(tags: params[:budget])
    #http://[::1]:3000/events?location=20&start_date=2025-08-29&end_date=2025-08-31
    if params[:start_date].present? && params[:end_date].present?
      events_filtered_by_date = events_filtered_by_tag.where("date >= ? and date <= ?", Date.parse(params[:start_date]), Date.parse(params[:end_date]))
      @events = events_filtered_by_date.near(current_user.address, params[:location].to_i)
    else
      @events = events_filtered_by_tag.near(current_user.address, params[:location].to_i)
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
    @events = Event.where(tags: @event.tags).where.not(id: @event.id)

    # @favorite = Favorite.new
  end
end
