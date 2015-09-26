class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_url, notice: 'Post successfully created.'
    else
      @posts = Post.all
      render :index
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post was successfully updated'
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end
