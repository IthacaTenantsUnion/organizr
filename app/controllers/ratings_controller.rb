class RatingsController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
    @rating = current_user.ratings.new rescue Rating.new
  end

  def create

  end
end
