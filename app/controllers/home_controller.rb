class HomeController < ApplicationController
  def index
  end

  def start_impersonate
    user = User.find_by(id: params[:user_id])
    impersonate_user(user) if user.present?
    redirect_to employee_detail_path
  end
  def stop_impersonating
    stop_impersonating_user
    redirect_to list_user_list_path
  end
end
