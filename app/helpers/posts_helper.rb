module PostsHelper

  def liked_post(post)
    return 'glyphicon-heart' if current_user.voted_for? post
    'glyphicon-heart-empty'
  end

  def display_likes(post)
    votes = post.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 5
    count_likers(votes)
  end

  private

  def list_likers(votes)
    user_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        user_names.push(voter.username)
      end
      user_names.to_sentence.html_safe + like_plural(votes)
    end
  end

  def count_likers(voters)
    vote_count = votes.size
    vote_count.to_s + ' likes'
  end

  def like_plural(votes)
    return ' likes this' if votes.count > 1
    ' likes this'
  end

end
