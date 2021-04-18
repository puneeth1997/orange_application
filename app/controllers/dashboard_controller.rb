class DashboardController < ApplicationController
  before_action :authenticate_admin!, only: [:admin_dashboard]
  before_action :authenticate_user!, only: [:user_dashboard]
  # def user_dashboard
  #   if current_user.class == Admin
  #     sign_out_and_redirect(current_user)
  #   end
  # end

  def admin_dashboard
    if current_user.class == User
      sign_out_and_redirect(current_user)
    end
  end
end
