class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Post successfully created'
    else
      render :new, danger: 'Post not created'
    end

  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Post successfully updated'
    else
      render :edit, danger: 'Post not updated'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, info: 'Post deleted'

  end

  private

  def set_post
    @post = Post.find(params[:id])

  end

  def post_params
    params.require(:post).permit(:title, :summary, :body)

  end




end
