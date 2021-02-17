class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @tenancies = Tenancy.includes(:unit, :landlord).where(tenant: current_user)
  end

  def edit
    @title = "Edit Profile"
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to profile_path, notice: "Updated successfully." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:race, :gender, :email)
  end
end
