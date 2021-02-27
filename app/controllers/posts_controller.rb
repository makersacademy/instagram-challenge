class PostsController < ApplicationController
    before_action :require_user_logged_in!

    def index
        @posts = Current.user.posts
    end

    def new
        @post = Post.new
    end

    def create
        @post = Current.user.posts.new(post_params)
        if @post.save
            redirect_to posts_path, notice: 'Post successfully created'
            return
        else
            render :new
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end
end