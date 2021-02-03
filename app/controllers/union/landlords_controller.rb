class Union::LandlordsController < Union::BaseController
  load_and_authorize_resource
  
  # GET /landlords or /landlords.json
  def index
    @landlords = Landlord.all
  end

  # GET /landlords/1 or /landlords/1.json
  def show
    @units = @landlord.units
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
        format.json { render [:union,:show], status: :created, location: @landlord }
      else
        format.html { render [:union,:new], status: :unprocessable_entity }
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
        format.html { render [:union,:edit], status: :unprocessable_entity }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landlords/1 or /landlords/1.json
  def destroy
    @landlord.destroy
    respond_to do |format|
      format.html { redirect_to landlords_url, notice: "Landlord was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landlord
      @landlord = Landlord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def landlord_params
      params.require(:landlord).permit(:name)
    end
end
