class Admin::BaseController < ApplicationController 
  before_action :authenticate_user!, :admins_only!


protected
  def admins_only!
    raise CanCan::AccessDenied unless current_user.admin?
  end
end
