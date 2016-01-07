class CommentService
  def initialize comment
    @comment = comment
  end

  def save
    if @comment.save
      true
    else
      false
    end
  end

  def update comment_params
    if @comment.update_attributes comment_params
      true
    else
      false
    end
  end

  def destroy
    if @comment.valid?
      @comment.destroy
      true
    else
      false
    end
  end
end
