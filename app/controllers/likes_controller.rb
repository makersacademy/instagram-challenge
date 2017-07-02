class LikesController < ApplicationController
  def create
     like = this_post.likes.create(user_id: current_user.id)
     redirect_to this_post
   end

   def destroy
     this_post.likes.find_by(user_id: current_user).destroy
     redirect_to this_post
   end

   private

   def like_post_id
     params.permit(:post_id)[:post_id]
   end

   def this_post
     post = Post.find(like_post_id)
   end

end
