require 'rails_helper'

RSpec.describe "User can create posts", type: :system do
  before do
    driven_by(:rack_test)
    sign_up
  end

  it 'allows a user to create a new post' do
    visit '/posts/new'
    fill_in 'post_content', with: 'I love seeds!'
    click_button 'Post'
    expect(page).to have_content ('I love seeds!')
    post_instance = Post.order("id").last

    expect(post_instance.username).to eq('rio')
    expect(post_instance.body).to eq('I love seeds!')
  end

end
