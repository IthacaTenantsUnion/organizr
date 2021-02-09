class Union::LandlordsController < Union::BaseController
  before_action :set_landlord, only: [:show, :edit, :destroy, :update]
  load_and_authorize_resource
  
  # GET /landlords or /landlords.json
  def index
    @landlords = @landlords.includes(:tenancies, tenancies: [:unit, :landlord]).all
  end

  # GET /landlords/1 or /landlords/1.json
  def show
    @units = @landlord.units
    @tenancies = @landlord.tenancies
  end

  # GET /landlords/new
  def new
    @landlord = Landlord.new
  end

  # GET /landlords/1/edit
  def edit
  end

  # POST /landlords or /landlords.json
  def create
    @landlord = Landlord.new(landlord_params)

    respond_to do |format|
      if @landlord.save
        format.html { redirect_to [:union,@landlord], notice: "Landlord was successfully created." }
        format.json { render [:union,@landlord], status: :created, location: @landlord }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landlords/1 or /landlords/1.json
  def update
    respond_to do |format|
      if @landlord.update(landlord_params)
        format.html { redirect_to [:union,@landlord], notice: "Landlord was successfully updated." }
        format.json { render [:union,:show], status: :ok, location: @landlord }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landlords/1 or /landlords/1.json
  def destroy
    @landlord.destroy
    respond_to do |format|
      format.html { redirect_to union_landlords_url, notice: "Landlord was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landlord
      @landlord = Landlord.includes(:tenancies, tenancies: [:unit, :landlord]).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def landlord_params
      params.require(:landlord).permit(:name)
    end
end
