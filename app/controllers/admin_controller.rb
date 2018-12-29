class AdminController < ApplicationController
  layout "admin"

  helper_method :current_user
  before_action :authorize, unless: proc { pages_controller? }

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize
      redirect_to admin_login_url, alert: "Not authorized" if current_user.nil?
    end

    def pages_controller?
      controller_path.starts_with?("admin/sessions")
    end
end
