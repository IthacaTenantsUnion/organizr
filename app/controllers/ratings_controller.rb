class RatingsController < ApplicationController
  # GET /ratings or /ratings.json
  def index
    @ratings = Rating.includes(:tenancy, tenancy: [:landlord, :tenant, :unit]).all
  end

  # GET /ratings/1 or /ratings/1.json
  def show
    @rating = Rating.includes(:tenancy, tenancy: [:landlord, :tenant, :unit]).find(params[:id])
  end
end
