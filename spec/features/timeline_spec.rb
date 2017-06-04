require 'rails_helper'

RSpec.feature 'Posts display on the timeline correctly', type: :feature do
  scenario 'User sees most recent post first' do
    sign_up
    user_makes_post
    user_makes_different_post
    expect(first('.post-container')).to have_content('Hello again!')
  end

  scenario 'Posts have date and time attatched' do
    sign_up
    user_makes_post
    date = Time.zone.now.strftime('%d/%m/%Y')
    time = Time.zone.now.strftime('%H:%M')
    expect(page).to have_content("#{date} at #{time}")
  end

  scenario 'Posts show the name of posting user' do
    sign_up
    user_makes_post
    expect(first('.post-username')).to have_content "MrAdmin"
  end

  scenario 'Uploaded images appear on the next screen' do
    sign_up
    find('#new-post').click
    attach_file('post_image', Rails.root + 'spec/support/assets/dog.jpg')
    fill_in :caption, with: "Hello world!"
    click_button "Post picture!"
    expect(page).to have_xpath("//img[contains(@src,'dog.jpg')]")
  end

  feature 'Posts display with correct filters', type: :feature do
    scenario 'Images have no filter by default' do
      sign_up
      user_makes_post
      expect(find('#post-picture')[:class]).to include 'none'
    end

    scenario 'Images with sepia filter display correctly' do
      sign_up
      user_makes_filtered_post('sepia')
      expect(find('#post-picture')[:class]).to include 'sepia'
    end

    scenario 'Images with blur filter display correctly' do
      sign_up
      user_makes_filtered_post('blur')
      expect(find('#post-picture')[:class]).to include 'blur'
    end

    scenario 'Images with colourise filter display correctly' do
      sign_up
      user_makes_filtered_post('colourise')
      expect(find('#post-picture')[:class]).to include 'colourise'
    end
  end
end
