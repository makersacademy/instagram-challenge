module ApplicationHelper
  def sign_up username: 'bob', email: '123@abc.com',
              password: '12345678', confirmation: '12345678'
    visit posts_path
    click_link 'Sign up'
    fill_in :Username, with: username
    fill_in :Email, with: email
    fill_in :Password, with: password
    fill_in :'Password confirmation', with: confirmation
    click_button 'Sign up'
  end

  def create_post
    visit posts_path
    click_link "Add post"
    fill_in :Title, with: "Beautiful Sunset"
    fill_in :Description, with: "blah blah blah blah"
    attach_file :Image, 'public/test/image.jpg'
    click_button 'Create Post'
  end

  def create_comment content: "wow your dinner looks so dreamy"
    click_link 'Comment'
    fill_in :Content, with: content
    click_button "Create Comment"
  end
end
