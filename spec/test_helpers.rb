def create_post_visit_route(user, &block)
  post = create(:post, user_id: user.id)
  visit '/'
  block.call(post)
end

def create_posts_visit_route(user, &block)
  post_1 = create(:post, text: 'Post 1', user_id: user.id)
  post_2 = create(:post, text: 'Post 2', user_id: user.id)
  visit '/'
  block.call(post_1, post_2)
end
