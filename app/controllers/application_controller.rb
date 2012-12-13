class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    case current_user.roles.first.name
      when 'admin'
        users_path
      else
        admin_content_dashboard_path
    end
  end

  def after_sign_up_path_for(resource)
  	
  end

end
