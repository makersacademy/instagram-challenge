def create_like
  visit '/posts'
  click_button "like-post-#{Post.first.id}"
end
