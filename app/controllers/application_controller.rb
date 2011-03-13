class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_actor_name

  def current_actor_name 
    ENV['BALE_ACTOR_NAME'] || "Default"
  end
end
