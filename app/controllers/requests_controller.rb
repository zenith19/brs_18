class RequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @requests = current_user.requests.page(params[:page]).per 10
  end

  def new
  end

  def create
    @request.user = current_user
    if @request.save
      flash[:success] = t ".flash_request_success"
      redirect_to requests_path
    else
      render :new
    end
  end

  def update
    @request.canceled!
    flash[:success] = t ".flash_request_update"
    redirect_to requests_path
  end

  private
  def request_params
    params.require(:request).permit :title, :author, :publisher, :link
  end
end
