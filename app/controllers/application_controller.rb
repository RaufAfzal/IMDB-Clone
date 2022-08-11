class ApplicationController < ActionController::Base
  def add_to_watchlist
    return @add_to_watchlist_exist ? "Remove from the watchlist" : "watchlist"

  end

  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
    
  end

  helper_method :add_to_watchlist
end


