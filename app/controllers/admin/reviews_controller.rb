module Admin
  class ReviewsController < ApplicationController
    before_action :is_admin?

    def index
      @reviews = Review.all
    end

    def destroy_multiple
      params[:review_ids].each do |id|
        @review = Review.find(id)
        @review.destroy
      end
      redirect_to admin_reviews_path
    end

    private
    def is_admin?
      if !(current_user && current_user.admin)
        redirect_to root_path
      end
    end
  end
end
