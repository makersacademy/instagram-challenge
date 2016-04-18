require 'rails_helper'

feature 'liking posts' do
  # before do
  #   firstpost = Post.create(description: 'First post', image_file_name: 'random.jpg')
  # end

  xscenario 'a user can like a post, which updates the post like count', js: true do
    create_post
    click_button 'Like'
    expect(page).to have_content('1 Like')
  end

end