# frozen_string_literal: true

require 'rails_helper.rb'

feature 'Creating Posts' do
  scenario 'can create a post with a logged in user' do
    login_as create( :user ), scope: :user
    visit new_post_path
    attach_file('post_image', "./files/images/caffeine-coffee-cup-6347.jpg")
    fill_in 'post_caption', with: 'Java time #brew'
    click_button 'Create Post'
    expect( Post.count ).to eq(1)
    expect(page).to have_content('#brew')
    expect(page).to have_css("img[src*='caffeine-coffee-cup-6347.jpg']")
  end

  scenario 'cannot create a post if not logged in user' do
    login_as create( :user ), scope: :user
    sign_out :user
    visit new_post_path
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
