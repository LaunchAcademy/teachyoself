class ReviewsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @reviews = @post.reviews
  end

  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def create
    @post = Post.find(params[:post_id])
    @review = Review.new(review_params)
    @review.post = @post
    @review.user = current_user
    if @review.save
      redirect_to :back, notice: "Review successfully created!"
    else
      redirect_to post_path(@post), notice: "Review not created. Please enter a rating."
    end
  end

  private
  def review_params
    params.require(:review).permit(:body, :rating, :user_id, :post_id)
  end

end
