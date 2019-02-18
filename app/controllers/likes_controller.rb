# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post, only: [:create, :destroy]

  def create
    if already_liked?
      nil
    else
      flash[:success] = "You liked #{@post.user.first_name}'s post'!"
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  def destroy
    @like = Like.find(params[:id])
    if !(already_liked?)
      nil
    else
      flash[:warning] = "You unliked #{@post.user.first_name}'s post'!"
      @like.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
