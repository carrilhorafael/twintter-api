class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: 201
    else
      render json: @post.errors, status: 422
    end
  end

  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    render json: @post
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: 422
    end
  end

  def destroy
    @post.destroy
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :content_text,
      :user_id
    )
  end
end
