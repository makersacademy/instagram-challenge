require 'rails_helper.rb'

feature 'User posts' do

  before(:each) do
    sign_up
  end

  scenario 'user can create a post with image and caption' do
    click_link 'New Post'
    fill_in 'Caption', with: 'my first post on vanity '
    attach_file('post_image', Rails.root + 'spec/fixtures/apple-touch-icon.png', make_visible: true)
    click_button 'Upload'
    expect(page).to have_content('my first post on vanity')
  end

  scenario 'user can edit post' do
    visit '/'
    create_post
    click_link 'Edit'
    fill_in 'Caption', with: 'changed my mind'
    click_button 'Upload'
    expect(page).to have_content('changed my mind')
  end
end
