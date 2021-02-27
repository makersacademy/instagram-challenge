require 'rails_helper'

feature "Sign in" do

  scenario "asks the user to enter username and password" do
    visit '/posts'
    expect(page).to have_content "Posts"
  end

  scenario 'can add a post' do
    visit '/posts'
    click_button 'New post'
    expect(current_path).to eq('/posts/new')
  end

end
