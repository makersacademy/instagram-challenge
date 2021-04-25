require 'rails_helper'

RSpec.describe "User can post Images", type: :system do
  before do
    driven_by(:rack_test)
    sign_up
  end

  it 'allows a user to attach an image to a post' do
    visit '/posts/new'
    fill_in 'post_content', with: 'I love seeds!'
    click_button 'Attach Image'
    click_button 'Post'
    expect(page).to have_content ('I love seeds!')
    post_instance = Post.order("id").last

    expect(post_instance.content).to eq('I love seeds!')
  end

end
