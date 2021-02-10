class UnitsController < ApplicationController
  # GET /units or /units.json
  def index
    @title = "Units"
    @units = Unit.all
  end

  # GET /units/1 or /units/1.json
  def show
    @unit = Unit.includes(:tenancies, tenancies: [:landlord, :tenant]).find(params[:id])
    @title = @unit&.address || "Not found"
  end
end
