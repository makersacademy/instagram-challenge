class Api::V1::PostsController < ApplicationController
  def show
    result = { posts: [] }
    Post.all.each do |post| 
      result[:posts].append(post.to_json)
    end
    render json: result
  end
end
