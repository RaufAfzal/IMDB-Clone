class AddToWatchlistController < ApplicationController
  def update
    add_to_watchlist = AddToWatchlist.where(movie: Movie.find(params[:movie]),user: current_user)
    if add_to_watchlist == []
      #create the watchlist
      AddToWatchlist.create(movie: Movie.find(params[:movie]),user: current_user)
      @add_to_watchlist_exist = true
    else
      #delete the watchlist
      add_to_watchlist.destroy_all
      @add_to_watchlist_exist = false


    end
    respond_to do |format|
      format.html {}
      format.js
    end
  end
end
