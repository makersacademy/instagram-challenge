module LikeHelper
  def user_has_liked?(article)
    Like.exists?(user_id: current_user.id, article_id: article.id)
  end
  def likes
    "0 likes"
    #TODO make this count the amount of likes
  end
end
