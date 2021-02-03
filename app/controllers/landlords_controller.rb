class LandlordsController < ApplicationController
  semantic_breadcrumb :index, :landlords_path

  # GET /landlords or /landlords.json
  def index
    @landlords = Landlord.includes(:tenancies, tenancies: [:unit, :tenant, :rating]).all
  end

  # GET /landlords/1 or /landlords/1.json
  def show
    @landlord = Landlord.includes(:tenancies, tenancies: [:unit, :tenant, :rating]).find(params[:id])
    semantic_breadcrumb @landlord.name, landlord_path(@landlord)
    @units = @landlord.units
  end
end
