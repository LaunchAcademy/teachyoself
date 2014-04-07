class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to new_user_session_path, notice: "Please sign in before posting."
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "Post successfully created!"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  private

  def post_params
    params.require(:post).permit(:title, :url, :description, :tags)
  end
end
