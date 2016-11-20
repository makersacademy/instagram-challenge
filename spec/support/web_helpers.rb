module WebHelpers

  def create_user
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: "test@testuser.com"
    fill_in 'Password', with: "123456"
    fill_in 'Password confirmation', with: "123456"
    click_button 'Sign up'
  end

  def create_user2
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: "test2@testuser.com"
    fill_in 'Password', with: "123456"
    fill_in 'Password confirmation', with: "123456"
    click_button 'Sign up'
  end

  def add_post
    visit '/posts/new'
    attach_file "Image", "spec/asset_specs/photos/test.jpg"
    fill_in 'post_caption', with: "my summer vacation"
    click_button 'Create Post'
    visit '/posts'
  end

  def add_post2
    visit '/posts/new'
    attach_file "Image", "spec/asset_specs/photos/test.jpg"
    fill_in 'post_caption', with: "my winter vaca"
    click_button 'Create Post'
    visit '/posts'
  end

  def submit_comment
    visit '/posts'
    click_link 'Write a Comment'
    fill_in 'comment_text', with: "this looks sicks"
    click_button "Create Comment"
  end
end
