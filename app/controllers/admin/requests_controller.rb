class Admin::RequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @requests = @requests.page(params[:page]).per 10
    @statuses = Request.statuses.select{|status| status == "approved" || status == "not_approved"}
  end

  def update
    BookService.new(@request).update request_params
    flash[:success] = t ".flash_request_update"
    redirect_to admin_requests_path
  end

  private
  def request_params
    params.require(:request).permit :status
  end
end
