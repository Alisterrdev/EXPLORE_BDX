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
      redirect_to event_path(@event), alert: "Impossible d'ajouter cet événement"
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @favorite = current_user.favorites.find(params[:id])
    if @favorite.destroy
      redirect_to event_path(@event), notice: "Événement retiré de vos favoris"
    else
      redirect_to event_path(@event), alert: "Impossible de retirer cet événement"
    end
  end
end
