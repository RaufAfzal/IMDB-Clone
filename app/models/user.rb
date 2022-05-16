class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :movies
  has_many :reviews, dependent: :destroy
  has_many :add_to_watchlists
  enum role:  [:Member, :Moderator, :Admin]
end
