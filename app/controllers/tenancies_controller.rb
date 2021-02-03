class TenanciesController < ApplicationController
  before_action :set_additional_params

  # GET /ratings
  def index
    @ratings = Tenancy.includes(:landlord, :unit).all
    if params[:unit_id]
      @ratings = @ratings.by_unit(@unit)
    elsif params[:landlord_id]
      @ratings = @ratings.by_landlord(@landlord)
    end
  end

  # GET /ratings/1
  def show
    @rating = Tenancy.includes(:landlord, :unit).find(params[:id])
    if params[:unit_id]
      @ratings.by_unit(@unit)
    elsif params[:landlord_id]
      @ratings.by_landlord(@landlord)
    end
  end

  private
  def set_additional_params
    @unit = Unit.find_by(id: params[:unit_id]) if params[:unit_id]
    @landlord = Landlord.find_by(id: params[:landlord_id]) if params[:landlord_id]
  end
end
