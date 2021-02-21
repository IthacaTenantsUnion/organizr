class Union::TenanciesController < Union::BaseController
  load_and_authorize_resource

  before_action :setup_form_data, only: %i[new edit]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  # GET /tenancies or /tenancies.json
  def index
    @title = "All Tenancies"
    @my_tenancies = current_user.tenancies.all
    @other_tenancies = Tenancy.where.not(tenant: current_user)
  end

  # GET /tenancies/1 or /tenancies/1.json
  def show
    @title = "#{@tenancy.start_date.strftime('%Y')} at #{@tenancy.unit.address}"
  end

  # GET /tenancies/new
  def new
    @title = "New Tenancy"
    @tenancy = current_user.tenancies.new
  end

  # GET /tenancies/1/edit
  def edit
    @title = "Editing Tenancy"
  end

  # POST /tenancies or /tenancies.json
  def create
    @tenancy = current_user.tenancies.build(tenancy_params)

    respond_to do |format|
      if @tenancy.save
        format.html { redirect_to [:union, @tenancy], notice: "Tenancy was successfully created." }
        format.json { render :show, status: :created, location: @tenancy }
      else
        setup_form_data
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tenancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Tenancies/1 or /Tenancies/1.json
  def update
    respond_to do |format|
      if @tenancy.update(tenancy_params)
        format.html { redirect_to [:union, @tenancy], notice: "Tenancy was successfully updated." }
        format.json { render :show, status: :ok, location: @tenancy }
      else
        setup_form_data
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tenancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Tenancies/1 or /Tenancies/1.json
  def destroy
    @tenancy.destroy
    respond_to do |format|
      format.html { redirect_to tenancies_url, notice: "Tenancy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def setup_form_data
      @units = Unit.all
      @landlords = Landlord.all
    end

    # Only allow a list of trusted parameters through.
    def tenancy_params
      params[:tenancy][:unit_id] = Unit.find_or_create_by(address: params[:tenancy].delete(:unit_address)).to_param
      params[:tenancy][:landlord_id] = Landlord.find_or_create_by(name: params[:tenancy].delete(:landlord_name)).to_param
      params.require(:tenancy).permit(:landlord_id, :landlord_name, :unit_address, :unit_id, :rent_total, :rent_portion, :start_date, :end_date, :overall, :repairs, :public_review, :private_review)
    end
end
