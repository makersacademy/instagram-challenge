def create_post
  visit('/ideas/new')
  fill_in(id: 'idea_name', with: 'Brilliant Idea')
  fill_in(id: 'idea_description', with: 'Brilliant Description')
  click_button('Create Idea')
end

def create_comment
  create_post
  fill_in(id:'comment_user_name', with: 'Ana')
  fill_in(id: 'comment_body', with: 'Nice Comment')
  click_button('Create Comment')
end
