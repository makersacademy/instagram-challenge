module LikesHelper

  def likes?(picture)
    !picture.likes.find_by(user_id: current_user.id).nil?
  end

  def current_user_like(picture)
    picture.likes.find_by(user_id: current_user.id)
  end
end
