class Admin::TenanciesController < Admin::BaseController
  load_and_authorize_resource

  def index
  end
end
