class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        
        @comment = @post.comments.create(comment_params.merge(commenter: current_user.email))

    
        redirect_to post_path(@post)
    end
    private
        def comment_params
            params.require(:comment).permit(:body, :commenter)
        end
end
