require 'rails_helper'

feature 'commenting' do
  before(:each) do
  user1 = User.create! :email => "aa@bb.com", :password => 'topsecret', :password_confirmation => 'topsecret'
  post = Post.create! :title => 'Poppy', :desc=> 'Genteel bouncy loving lab', :user_id=> user1.id
  end

  scenario 'allows user to add a comment on a post' do
    sign_up
    visit '/posts'
    click_link 'Comment on Poppy'
    fill_in "Thoughts", with: "woof!"
    click_button 'Comment'
    expect(current_path).to eq '/posts'
  end

  scenario 'comments are displayed on /posts' do
    sign_up
    visit '/posts'
    click_link 'Comment on Poppy'
    fill_in "Thoughts", with: "woof..woof!"
    click_button 'Comment'
    expect(current_path).to eq '/posts'
    click_link 'Poppy'
    expect(page).to have_content('woof..woof!')
  end
end
