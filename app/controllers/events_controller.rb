class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:tags].present?
      events_filtered_by_tag = Event.where(tags: params[:tags]).order(:date)
    else
      events_filtered_by_tag = Event.all
    end

    if params[:date].present?
      start_date = params[:date].first(10)
      end_date = params[:date].last(10)
      events_filtered_by_date = events_filtered_by_tag.where("date >= ? and date <= ?", Date.parse(start_date), Date.parse(end_date))
      # @events = events_filtered_by_date.near(current_user.address, params[:location].to_i).reorder(date: :asc)
    else
      events_filtered_by_date = events_filtered_by_tag
    end


    if params[:location].present?
      @events = events_filtered_by_date.near(current_user.address, params[:location].to_i)
    else
      @events = events_filtered_by_date
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
