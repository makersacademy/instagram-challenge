class PostsController < ApplicationController
    before_action :require_user_logged_in!
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Current.user.posts
    end

    def new
        @post = Post.new
    end

    def update
        if @post.update(post_params)
            redirect_to posts_path, notice: 'Post successfully updated'
            return
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path, notice: 'Post has been deleted'
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

    def edit

    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end

    def set_post
        @post = Current.user.posts.find(params[:id])
    end
end