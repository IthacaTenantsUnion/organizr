class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)
    @signup.save
  end

  private

  def signup_params    
    params.require(:signup).permit(:name, :email, :phone, :landlord_name, :unit_address, :overall, :repairs, :public_review, :private_review, :income, :rent_total, :number_of_occupants)
  end
end
