class ApplicationController < ActionController::Base
  semantic_breadcrumb :index, :root_path
  layout "basic"

  def home
    if current_user.present?
      redirect_to tenancies_path
    else
      redirect_to ratings_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
end
