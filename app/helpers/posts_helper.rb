module PostsHelper
  def already_liked(post)
    return "glyphicon glyphicon-heart" if post.votes_for.up.by_type(User).voters.include? current_user
    return "glyphicon glyphicon-heart-empty"
  end
end
