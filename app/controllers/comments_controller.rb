class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment.user = current_user
    CommentService.new(@comment).save
    respond_to do |format|
      format.js
    end
  end

  def update
    CommentService.new(@comment).update comment_params
    respond_to do |format|
      format.js
    end
  end

  def destroy
    CommentService.new(@comment).destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end
