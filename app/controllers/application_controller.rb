class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  layout :layout_by_resource

  private
  def layout_by_resource
    devise_controller? ? "devise" : "application"
  end
end
