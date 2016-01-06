class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :load_book

  def create
    @review.user = current_user
    if ReviewService.new(@review, @book).save
      @comment = @review.comments.new
      respond_to do |format|
        format.html do
          flash[:success] = t "add_review_sucessful_message"
          redirect_to @review.book
        end
        format.js
      end
    else
      respond_to do |format|
        format.html do
          flash[:danger] = t "add_review_fail_message"
          redirect_to @review.book
        end
        format.js
      end
    end
  end

  def update
    if ReviewService.new(@review, @book).update review_params
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @book = @review.book
    if ReviewService.new(@review, @book).destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def review_params
    params.require(:review).permit :rating, :content, :book_id
  end

  def load_book
    @book = @review.book
  end
end
