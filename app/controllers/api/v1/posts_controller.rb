module Api
  module V1
    class PostsController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        posts = Post.all 
        render json: PostSerializer.new(posts).serialized_json
      end

      def show
        post = Post.find(id: params[:id])
        render json: PostSerializer.new(post).serialized_json
      end

      def create
        post = Post.new(post_params)

        if post.save
          render json: PostSerializer.new(post).serialized_json
        else
          render json: { error: post.errors.messages }, status: 422
        end
      end

      def destroy
        post = Post.find(params[:id])

        if post.destroy
          head :no_content
        else
          render json: { error: post.errors.messages }, status: 422
        end
      end

      private

      def post_params
        params.require(:post).permit(:image_url, :user_i, :comments)
      end

    end
  end
end