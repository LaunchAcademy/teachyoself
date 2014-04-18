class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if !(params[:search].blank?)
      @posts = Post.search(params[:search])
    else
      @posts = Post.includes([:reviews])
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post), notice: "Post successfully created!"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @review = Review.new
    @reviews = @post.reviews
  end


  private
  def post_params
    params.require(:post).permit(:title, :url, :description, :tags, :search)
  end
end
