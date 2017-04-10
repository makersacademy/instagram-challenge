module PostsHelper

  def liked_post(post)
    if current_user
      if current_user.voted_for? post
        return 'glyphicon-heart'
      else
        'glyphicon-eye-open'
      end
end
  end

  def count_likes(post)
    votes = post.votes_for.up.by_type(User)
    vote_count = votes.size
    if votes.count > 1
      vote_count.to_s + ' likes'
    else
      vote_count.to_s + 'like'
    end
  end

end
