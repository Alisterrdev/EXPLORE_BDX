class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  # def show
  #   @favorite = Event.find(params[:id])
  # end

  def create
    @event = Event.find(params[:event_id])
    @favorite = current_user.favorites.new(event: @event)
    if @favorite.save
      redirect_to event_path(@event), notice: "Evenement ajouté"
    else
      redirect_to event_path(@event), alert: "Cet événement n'est pas accessible"
    end
  end
end
