require 'rails_helper'
require 'web_helper'

feature 'Users can like a post' do
  scenario 'user likes on a post' do
    create_new_user
    visit '/posts'
    visit new_post_path
    page.attach_file("post_image", Rails.root + 'spec/fixtures/Cookies.jpg')
    fill_in 'Caption', with: 'Caption'
    click_button('Create Post')
    click_button('Like')

    expect(page).to have_content("1 Like")
  end

  scenario 'user cannot like the same post more than once' do
    create_new_user
    visit '/posts'
    visit new_post_path
    page.attach_file("post_image", Rails.root + 'spec/fixtures/Cookies.jpg')
    fill_in 'Caption', with: 'Caption'
    click_button('Create Post')
    click_button('Like')

    expect(page).not_to have_button("Like")
  end

  scenario 'user can unlike a post' do
    create_new_user
    visit '/posts'
    visit new_post_path
    page.attach_file("post_image", Rails.root + 'spec/fixtures/Cookies.jpg')
    fill_in 'Caption', with: 'Caption'
    click_button('Create Post')
    click_button('Like')
    click_button('Unlike')

    expect(page).to have_content("Like")
  end

    scenario 'user can only unlike a post that they have liked' do
      create_new_user
      visit '/posts'
      visit new_post_path
      page.attach_file("post_image", Rails.root + 'spec/fixtures/Cookies.jpg')
      fill_in 'Caption', with: 'Caption'
      click_button('Create Post')
      click_button('Like')

      expect(page).to have_button("Unlike")
    end
end
