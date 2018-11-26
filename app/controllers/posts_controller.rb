# frozen_string_literal: true

require 'pry'

class PostsController < ApplicationController
  before_action :authenticate_user!

  include ApplicationHelper::Likeable.new Post
  include ApplicationHelper::Commentable.new Post

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.includes(:comments).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:photo).merge(user: current_user)
  end
end

# <%= render "likes/like_form", likeable: comment %>
# <%= render "comments/form", commentable: comment %>
