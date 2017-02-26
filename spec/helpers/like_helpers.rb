def create_like
  visit '/posts'
  click_link 'Like'
end
