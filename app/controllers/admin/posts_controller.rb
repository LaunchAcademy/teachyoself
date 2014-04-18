module Admin
  class PostsController < ApplicationController
    before_action :is_admin?

    def index
      @posts = Post.includes(:reviews).all
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end

    private
    def is_admin?
      if !(current_user && current_user.admin)
        redirect_to root_path
      end
    end
  end
end
