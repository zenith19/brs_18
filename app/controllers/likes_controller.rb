class LikesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @activity = Activity.find like_params[:activity_id]
    @like.save
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def destroy
    like = Like.find params[:id]
    @activity = like.activity
    @like.destroy
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  private
  def like_params
    params.require(:like).permit :user_id, :activity_id
  end
end
