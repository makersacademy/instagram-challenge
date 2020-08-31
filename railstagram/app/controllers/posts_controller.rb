class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        post_params = params.require(:post).permit(:caption, :image)
        @post = Post.create(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to posts_path
        else
            flash[:errors] = @post.errors.full_messages
            render 'new'
        end
    end
end
