require 'rails_helper'

feature 'likes' do
  before do
    sign_up
    visit '/pictures'
    click_link 'Add a picture'
    attach_file "Image", "spec/asset_specs/photos/uku.jpg"
    click_button 'Create Picture'
  end

  scenario 'liking a picture' do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content '1 like'
    expect(Picture.all[0].likes.count).to eq 1
    expect(Picture.all[0].likes[0].user_id).not_to eq nil
  end

  scenario 'liking a picture twice unlikes it' do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_link 'Unlike'
    click_link 'Unlike'
    expect(page).to have_content '0 likes'
    expect(Picture.all[0].likes.count).to eq 0
  end

  def sign_up
    visit '/'
    click_link 'Sign up'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end
end