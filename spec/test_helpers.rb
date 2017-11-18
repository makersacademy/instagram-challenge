def create_post_visit_route(&block)
  post = create(:post)
  visit '/'
  block.call(post)
end

def create_posts_visit_route(&block)
  post_1 = create(:post, text: 'Post 1')
  post_2 = create(:post, text: 'Post 2')
  visit '/'
  block.call(post_1, post_2)
end