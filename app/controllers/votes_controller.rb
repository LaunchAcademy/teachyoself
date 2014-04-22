class VotesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @review = Review.find(params[:review_id])

    @vote = Vote.where(review: @review, user: current_user).first
    @vote ||= Vote.new(review: @review, user: current_user)
    @vote.assign_attributes(vote_params)

    if @vote.save
      flash[:notice] = 'Successfully saved vote.'
    else
      flash[:alert] = 'Failed to save vote.'
    end

    redirect_to post_path(@review.post)
  end

  private

  def vote_params
    params.require(:vote).permit(:vote)
  end
end
