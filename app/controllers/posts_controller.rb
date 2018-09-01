# frozen_string_literal: true

class PostsController < ApplicationController
  def index
  end

  def new
    @posts = Post.new
  end
end
