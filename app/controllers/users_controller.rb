class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = @users.page(params[:page]).per 10
  end

  def show
  end
    
  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = t "update_success_message"
      redirect_to root_path # will change later
    else
      flash[:notice] = t "user_update_notice"
      render :edit
    end   
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :picture
  end
end