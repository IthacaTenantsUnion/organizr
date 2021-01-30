class RatingsController < ApplicationController
  load_and_authorize_resource :tenancy
  load_and_authorize_resource :rating, through: :tenancy, singleton: true
  #before_action :set_rating, only: %i[ show edit update destroy ]
  before_action :setup_form_data, only: %i[new edit]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  # GET /ratings or /ratings.json
  def index
    @ratings = Rating.includes(:tenancy, tenancy: [:landlord, :user, :unit]).all
  end

  # GET /ratings/1 or /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = @tenancy.rating.build
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings or /ratings.json
  def create
    @rating = current_user.ratings.build(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: "Rating was successfully created." }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { setup_form_data; render :new, status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1 or /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: "Rating was successfully updated." }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1 or /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: "Rating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_rating
    #  @rating = Rating.find(params[:id])
    #end

    def setup_form_data
      @tenancy = Tenancy.find(params[:tenancy_id])
    end

    # Only allow a list of trusted parameters through.
    def rating_params
      params.require(:rating).permit(:overall, :repairs, :review)
    end
end
