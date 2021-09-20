class PostsController < ApplicationController

    def index
        # this method is going to need parameters passed to it
        @new_post = Post.new
        @list_posts = Post.all.order(created_at: :desc)
      end
    
      def create
        @new_post = Post.create(post_params)
        redirect_to '/index'
      end

private

def post_params
    params.require(:post).permit(:description, :users_id, :post_image)
  end

end
