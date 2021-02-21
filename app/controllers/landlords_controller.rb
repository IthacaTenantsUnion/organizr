class LandlordsController < ApplicationController
  # GET /landlords or /landlords.json
  def index
    @title = "Landlords"
    @landlords = Landlord.includes(:tenancies, tenancies: [:unit, :tenant]).all
  end

  # GET /landlords/1 or /landlords/1.json
  def show
    @landlord = Landlord.includes(:tenancies, tenancies: [:unit, :tenant]).find(params[:id])
    @title = @landlord.name
    @units = @landlord.units
  end

  # GET /landlords/search.json
  def search
    q = params[:q].downcase
    @landlords = Landlord.where("name ILIKE ?", "%#{q}%").limit(6)

    response do
      format.json { @landlords.json }
    end
  end
end
