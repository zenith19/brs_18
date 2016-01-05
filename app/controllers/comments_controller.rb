class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end
