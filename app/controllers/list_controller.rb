class ListController < ApplicationController
  before_action :authenticate_admin!, only: [:user_list]

  def user_list
    @users = User.all#search(params[:search]).paginate(page: params[:page], per_page: 5)
   puts session.id
  #User.find(session[:user_id])
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
    end
  end

  def assign_points
    @users = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.email = params[:email]
    @user.points = @user.points.to_i + params[:points].to_i
    @user.doj = Date.parse(params[:doj])
    if @user.valid?
      @user.save
      TestMailer.aprisal(@user).deliver
      redirect_to list_user_list_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.is_deleted = true
    user.save
    redirect_to list_user_list_path
  end

  def import
    User.import(params[:file])
    redirect_to list_user_list_path, notice: "Products imported."
  end

  def impersonate
    @user=User.find(params[:user_id])
    warden = env['warden']
if warden.authenticated?(:admin)
  warden.authenticated?(:user) && warden.logout(:user)
  # redirect_to warden.session(:admin)[:redirect_back] = "/dashboard/admin_dashboard"
    # warden.session(:user)[:redirect_back] = "/employee/employ"

  warden.set_user(@user, scope: :user)
  redirect_to employee_detail_path 
end



    # session[:current_user_id] = params[:user_id]
    # # User.find(session[:current_user_id])
    # redirect_to dashboard_user_dashboard_path
  end
  def stop_impersonate
    warden = env['warden']
warden.authenticated?(:admin) && warden.authenticated?(:user) # activate both sessions
warden.logout(:user) # log out only the user session, and only the user session data is cleared.

redirect_to warden.session(:admin)[:redirect_back] || "/list/user_list"
  end
end
