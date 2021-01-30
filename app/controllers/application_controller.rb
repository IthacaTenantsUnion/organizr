class ApplicationController < ActionController::Base
  semantic_breadcrumb :index, :root_path
  layout "basic"
end
