class Admin::RequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @requests = @requests.page(params[:page]).per 10
  end

  def update
    @request.update_attributes request_params
    flash[:success] = t ".flash_request_update"
    redirect_to admin_requests_path
  end

  private
  def request_params
    params.require(:request).permit :status
  end
end
