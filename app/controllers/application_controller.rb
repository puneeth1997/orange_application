class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
   #impersonates :user





  def after_sign_in_path_for(resource)
   if resource == @admin
      dashboard_admin_dashboard_path
   else 
      employee_detail_path
   end
  end

  def after_sign_out_path_for(resource_or_scope)
      root_path
  end

  # def after_sign_up_path_for(resource)
  #   '/dashboard/admin_dashboard' # Or :prefix_to_your_route
  # end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:points, :doj])
  end

  # def after_sign_up_path_for(resource)
  #   '/dashboard/admin_dashboard' # Or :prefix_to_your_route
  # end
end

  # def after_sign_up_path_for(resource)
  #   puts "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
  #   puts resource
  #   if resource == @user
  #     list_user_list_path
  #   else
  #     super
  #   end
  # end

