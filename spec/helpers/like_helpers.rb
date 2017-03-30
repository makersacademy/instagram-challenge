def create_like
  visit '/posts'
  click_link "like-post-#{Post.first.id}"
end
