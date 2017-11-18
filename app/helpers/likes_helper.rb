module LikesHelper
  def self.enableLike?(post, user)
    if user.nil?
      return false
    end
    Like.where(post_id: post.id, user_id: user.id).empty? 
  end

end
