class MoviesController < ApplicationController
before_action :set_movie, only: %i[ show edit update destroy sort]
before_action :authenticate_user!, except: [:index,:show]


# GET /movies or /movies.json

  def index
    if current_user.present?
    # @movies = policy_scope(Movie)
    @movies = Movie.movie_with_reviews.order(:sort).all
    end

  end

  


  def search

    # @movies = Movie.search(params[:q])
    @movies=Movie.movie_title(params[:q])
  end




# GET /movies/1 or /movies/1.json
  def show
  # byebug
  # authorize @movie
    @reviews = @movie.reviews.long_reviews.order("created_at DESC ")
    @add_to_watchlist_exist = AddToWatchlist.where(movie: @movie, user: current_user) ==[] ?false :true
  end

# GET /movies/new
  def new

  # byebug
    @movie = Movie.new
    1.times { @movie.cast_memebers.build}
    @movie.pictures.build
  



  end

# GET /movies/1/edit
  def edit
    @movie = Movie.find_by(id: params[:id])
    authorize @movie
  end

# POST /movies or /movies.json
  def create
    
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      
      end
    end
  end

# PATCH/PUT /movies/1 or /movies/1.json
def update

 
  @movie = Movie.find_by(id: params[:id])
  authorize @movie
  respond_to do |format|
    if @movie.update(movie_params)
      format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
      format.json { render :show, status: :ok, location: @movie }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @movie.errors, status: :unprocessable_entity }
    end
  end
end


# DELETE /movies/1 or /movies/1.json
def destroy
  @movie.destroy

  respond_to do |format|
    format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
    format.json { head :no_content }
  end
end


def sort
  # byebug
  params[:movie].each_with_index do |id, index|
    Movie.where(id: id).update_all(sort: index+1)
  end
  head :ok
end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image,:role,:status,:sort, :user_id,
                  pictures_attributes: [:id, pictures: [] ],
                  cast_memebers_attributes: [:id,:name,:role,:_destroy],)
  end

end

