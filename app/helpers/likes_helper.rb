module LikesHelper
  def self.enableLike?(post, user)
    if user.nil?
      return false
    end
     true
  end
end
