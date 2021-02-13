# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, except: :create

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id if current_user

    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post), notice: "Nothing"
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @comment.destroy
    redirect_to poat_path(@post)
  end

private
  def comment_params
    params[:comment].permit(:comment)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
