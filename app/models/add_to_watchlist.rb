class AddToWatchlist < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
