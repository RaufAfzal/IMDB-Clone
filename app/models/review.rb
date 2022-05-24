class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  scope :long_reviews,-> { where("rating > 7")}
  after_create :update_average_rating


  def update_average_rating
    movie = self.movie
    new_rating = movie.rating.present? ? (movie.rating.to_f + self.rating.to_f) / 2 : self.rating
    movie.update(rating: new_rating)
     end
     
end
