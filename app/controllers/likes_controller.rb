class LikesController < ApplicationController

  def create
     @post = Post.find(params[:post_id])
     if !current_user.has_liked?(@post)
       @like = @post.build_like(current_user)
       if @like.save
         render json: {new_like_count: @post.likes.count}
       else
         render :new
       end
    else
      flash[:notice] = 'You have already liked this post'
      redirect_to :back
    end
  end



end
