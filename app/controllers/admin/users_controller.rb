class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = @users.page(params[:page]).per 10
  end

  def destroy
    if @user.destroy
      flash[:success] = t :delete_success_message
      redirect_to admin_users_path
    else
      flash[:danger] = t :user_removal_failure
    end
  end
end
