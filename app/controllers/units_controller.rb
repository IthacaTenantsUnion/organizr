class UnitsController < ApplicationController
  # GET /units or /units.json
  def index
    @title = "Units"
    @units = Unit.all
  end

  # GET /units/1 or /units/1.json
  def show
    @unit = Unit.includes(:leases, leases: [:landlord, :tenant]).find(params[:id])
    @title = @unit&.address || "Not found"
  end

  # GET /landlords/search.json
  def search
    q = params[:q].downcase
    @units = Unit.where("address ILIKE ?", "%#{q}%").limit(6)

    response do
      format.json { @units.json }
    end
  end
end
