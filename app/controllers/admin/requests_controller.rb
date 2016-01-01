class Admin::RequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @requests = @requests.page(params[:page]).per 10
  end

  def destroy
    @request.destroy
    flash[:success] = t ".flash_request_deleted"
    redirect_to admin_requests_path
  end
end
