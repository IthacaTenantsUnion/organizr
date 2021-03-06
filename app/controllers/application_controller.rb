class ApplicationController < ActionController::Base
  layout "basic"

  def home
    if current_user.present?
      redirect_to union_tenancies_path and return
    end

    respond_to do |format|
      format.html
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.new_user_session_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
end
