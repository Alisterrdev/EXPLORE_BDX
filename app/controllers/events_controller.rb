class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:tags].present?
      events_filtered_by_tag = Event.where(tags: params[:tags]).order(:date)
    else
      events_filtered_by_tag = Event.all
    end

    if params[:location].present?
      events_filtered_by_location = events_filtered_by_tag.near(current_user.address, params[:location].to_i)
    else
      events_filtered_by_location = events_filtered_by_tag

    end

    if params[:start_date].present? && params[:end_date].present?
      @events = events_filtered_by_location.where("date >= ? and date <= ?", Date.parse(params[:start_date]), Date.parse(params[:end_date]))
    else
      @events = events_filtered_by_location
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
    @events = Event.where(tags: @event.tags).where.not(id: @event.id).order(:date)

    # @favorite = Favorite.new
  end
end
