class Union::RatingsController < Union::BaseController
  load_and_authorize_resource :tenancy
  load_and_authorize_resource :rating, through: :tenancy, singleton: true, except: :index
  #before_action :set_rating, only: %i[ show edit update destroy ]
  before_action :setup_form_data, only: %i[new edit]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  # GET /ratings or /ratings.json
  def index
    @ratings = Rating.includes(:tenancy, tenancy: [:landlord, :tenant, :unit]).all
  end

  # GET /ratings/1 or /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new(tenancy: @tenancy)
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings or /ratings.json
  def create
    @rating = Rating.new(rating_params.merge(tenancy: @tenancy))

    respond_to do |format|
      if @rating.save
        format.html { redirect_to [:union,@tenancy,@rating], notice: "Rating was successfully created." }
        format.json { render [:union,:show], status: :created, location: @rating }
      else
        setup_form_data
        format.html { render [:union,:new], status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1 or /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to [:union,@tenancy,@rating], notice: "Rating was successfully updated." }
        format.json { render [:union,:show], status: :ok, location: @rating }
      else
        setup_form_data
        format.html { render [:union,@tenancy,:edit], status: :unprocessable_entity }
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
