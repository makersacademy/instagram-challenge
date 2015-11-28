module Helpers
  def login(user)
    visit('/')
    click_link('Login')
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Log in')
  end

  def add_post
    visit '/'
    click_link 'Add a Post'
    fill_in 'Caption', with: '#testing'
    page.attach_file("Image", Rails.root + 'spec/fixtures/images/example.png')
    click_button 'Post!'
  end

  def comment
    visit '/posts'
    click_link "#{post.id}"
    click_link 'Comment'
    find(:css, '#textarea').set "Looking Good!"
    click_button 'Create Comment'
  end
end
