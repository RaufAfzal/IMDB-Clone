class CastMemeber < ApplicationRecord
  belongs_to :movie

  enum role:  [:hero, :director, :Producer]
end
