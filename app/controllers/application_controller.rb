class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  include PublicActivity::StoreController
  hide_action :current_user

  def after_sign_in_path_for(resource)
    admin_canines_path
  end

  def js_redirect_to(path)
    render js: %(window.location.href='#{path}') and return
  end
end
