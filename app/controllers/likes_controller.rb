class LikesController < ApplicationController
    def new
        @post = Post.find(params[:post_id])
        @like = Like.new
        @likes = Like.all
      end

    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
          else
        @post = Post.find(params[:post_id])
        @like = @post.likes.create( user_id: session[:user_id])
    end
            redirect_to '/posts'
    
    end 

    private
    def already_liked?
        Like.where(user_id: session[:user_id], post_id: params[:post_id]).exists?
      end

end
