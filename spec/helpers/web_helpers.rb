def add_post(comment, file )
  visit '/'
  click_link 'New post'
  fill_in 'post[comment]', with: comment
  attach_file 'post[avatar]', file
  click_button 'Create Post'
end

def add_comment(comment)
  visit '/'
  find(:xpath, "//a[contains(@href,'posts/1')]").click
  fill_in 'comment[body]', with: comment
  click_button 'Create Comment'
end

def show_post_to_update
  visit '/'
  find(:xpath, "//a[contains(@href,'posts/1')]").click
  click_link 'Update post'
end
