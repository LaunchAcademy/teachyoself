class ReviewsController < ApplicationController
  def index
    @post = Post.find(params[:post_id]).include([:reviews])
    @reviews = @post.reviews
    @vote = @post.reviews.votes
  end

  def new
    @post = Post.find(params[:post_id])
    @review = @post.reviews.build
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to :back, notice: "Review successfully created!"
    else
      redirect_to :back, notice: "Review not created. Please enter a rating."
    end
  end

  def vote
    binding.pry
  end

  private
  def review_params
    params.require(:review).permit(:body, :rating).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
