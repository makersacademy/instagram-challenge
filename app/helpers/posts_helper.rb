module PostsHelper

  def username(name)
    name.split('@').first
  end

  def comments_for_post(post, comments)
    comments.all.select { |c| c.post_id == post.id }
  end

end
