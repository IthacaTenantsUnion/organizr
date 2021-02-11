class Union::UnitsController < Union::BaseController
  before_action :set_unit, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /units or /units.json
  def index
    @units = Unit.all
  end

  # GET /units/1 or /units/1.json
  def show
    @tenancies = Tenancy.by_unit(@unit)
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units or /units.json
  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to [:union,@unit], notice: "Unit was successfully created." }
        format.json { render [:union,:show], status: :created, location: @unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1 or /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to [:union,@unit], notice: "Unit was successfully updated." }
        format.json { render [:union,:show], status: :ok, location: @unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1 or /units/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to union_units_url, notice: "Unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unit_params
      params.require(:unit).permit(:address, :number_of_occupants, :building_type)
    end
end
