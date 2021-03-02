class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comments = Comment.all
  end 

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      if @comment.save
        redirect_to '/posts'
      else
        # TODO: insert alert message
        redirect_to new_post_comment_path(@post.id)
      end
    end  
  
    private
      def comment_params
        user_id = session[:user_id]
        params.require(:comment).permit(:text).merge(:user_id => user_id)
      end
      
end