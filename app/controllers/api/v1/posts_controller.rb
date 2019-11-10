class Api::V1::PostsController < ApplicationController
  def show
    result = { posts: [] }
    Post.all.each do |post| 
      result[:posts].append(post.to_json)
    end
    render json: result
  end

  def create
    begin
      post = Post.create(post_params)
      render json: post.to_json
    rescue StandardError => e
      render json: { failure: { message: e.message } }
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :url).merge(user_id: @current_user.id)
  end
end
