class RequestsController < ApplicationController
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
      redirect_to root_path
    else
      flash[:success] = t ".flash_request_success"
      render :new
    end
  end

  private
  def request_params
    params.require(:request).permit :title, :author, :pulisher, :link
  end
end
