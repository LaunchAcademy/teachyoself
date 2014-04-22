module Admin
  class PostsController < ApplicationController
    before_action :is_admin?

    def index
      @posts = Post.all
    end

    def destroy_multiple
      if params[:post_ids]
        params[:post_ids].each do |id|
          @post = Post.find(id)
          @post.destroy
        end
      end
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
