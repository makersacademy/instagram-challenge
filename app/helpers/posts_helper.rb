module PostsHelper
  LIKERS_MAX = 5

  def already_liked?(post)
    return "glyphicon-heart" if current_user.voted_for?(post)
    "glyphicon-heart-empty"
  end

  def already_liked_path?(post)
    return unlike_post_path(post) if current_user.voted_for?(post)
    like_post_path(post)
  end

  def display_likes(post)
    votes = post.votes_for.up.by_type(User)
    return likes_count(votes) if votes.count > LIKERS_MAX
    likers_of(votes)
  end

  private

  def likers_of(votes)
    usernames = []
    unless votes.blank?
      votes.voters.each do |voter|
        usernames.push(voter.username)
      end
      usernames.to_sentence.html_safe + like_plural(votes)
    end
  end

  def likes_count(votes)
    "#{votes.count} like".pluralize(votes.count)
  end

  def like_plural(votes)
    return " like this" if votes.count > 1
    " likes this"
  end

end
