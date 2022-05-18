class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :cast_memebers,dependent: :destroy, inverse_of: :movie
  has_many :pictures, as: :imageable
  has_attached_file :image, styles: { thumb: "64x64#", small: "100x100#", med: "400x600>", large: "200x200>" }
  accepts_nested_attributes_for :cast_memebers,allow_destroy: true,reject_if: ->(attrs) { attrs['name'].blank?}
  accepts_nested_attributes_for :pictures


  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, presence: true, uniqueness: true


  enum role:  [:hero, :Producer, :director]
  enum status:  [:Draft, :Published, :Reject]



  # def self.search(title)
  #   if title
  #     Movie.where('title LIKE ?', "%#{title}%")
  #   else
  #     all
  #   end
  # end

  scope :movie_title, ->(title) {where('title LIKE ?', "%#{title}%")}

  scope :long_reviews,-> { where('rating > 7')}

 scope :status_with_reviews, ->(status) {where(status: status).where("rating >= ?", '5.0')}
 


end






