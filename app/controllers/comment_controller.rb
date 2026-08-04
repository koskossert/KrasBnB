class CommentController < ApplicationController
  def new
    @comment = Comment.new
  end
  def create
    @comment = current_user.comment.build(comment_param)
    @listing = Listing.find(params[:listing_id])
    @comment.listing = @listing

    if @comment.save
      redirect_to @comment.listing
    end
  end

  private

  def comment_param
    params.permit(:body, :listing_id, :user_id)
  end
end
