class CommentController < ApplicationController
  before_action :set_comment, only: [:show, :destroy, :update]
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      render json: @comment.errors, status: 422
    end
  end

  def index
    @comments = Comment.all

    render json: @comments
  end

  def show
    render json: @comment
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: 422
    end
  end

  def destroy
    @comment.destroy
  end

  def create_like
    @likecomment = LikeComment.new(like_params)

    if @likecomment.save
      render json: @likecomment, status: 201
    else
      render json: @likecomment.errors, status: 422
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(
      :content_text,
      :user_id,
      :parent_coment_id
    )
  end

  def like_params
    params.require(:like).require(
      :comment_id,
      :user_id
    )
  end

end
