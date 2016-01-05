class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = @users.page(params[:page]).per 20
  end

  def show
    @user_books = UserBook.by_user(current_user.id).page(params[:page]).per 5
    @books = Book.favourite(current_user.id).page(params[:fbook_page]).per 5
    @user_activities = User.review_activities current_user

    load_follow_dependencies(params[:type]) if params[:type]
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = t :update_success_message
      redirect_to root_path # will change later
    else
      flash[:notice] = t :user_update_notice
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :picture
  end

  def load_follow_dependencies role
    @title = t role.to_s
    @users= @user.send role
  end
end
