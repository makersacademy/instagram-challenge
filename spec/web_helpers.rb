def create_post
  visit('/insta_posts/new')
  fill_in('insta_post[title]', with: 'generic title')
  fill_in('insta_post[description]', with: 'generic description')
  click_button(value: 'Save Insta post')
end

def create_second_post
  visit('/insta_posts/new')
  fill_in('insta_post[title]', with: 'second title')
  fill_in('insta_post[description]', with: 'second description')
  click_button('Save Insta post')
end

def try_creating_post_with_no_title
  visit('/insta_posts/new')
  fill_in('insta_post[description]', with: 'second description')
  click_button('Save Insta post')
end

def edit_post
  click_button(value: "Edit")
  fill_in('insta_post[title]', with: 'new title')
  fill_in('insta_post[description]', with: 'new description')
  click_button(value: "Update Insta post")
end
