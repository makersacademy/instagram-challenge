def create_comment(content="I love them too! Where can I get these???")
  visit '/posts'
  fill_in 'comment_content', with: content
  click_button 'Create Comment'
end
