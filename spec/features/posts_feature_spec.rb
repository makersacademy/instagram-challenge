require 'rails_helper'

feature 'posts' do
  context 'no posts' do
    scenario 'should display a prompt to post an image' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post an image'
    end
  end

  context 'post in DB' do

    let!(:post1) { create(:post) }
    let(:post2) { build(:post) }

    scenario 'display restaurants' do
      visit '/posts'
      expect(page).to have_content post1.caption
      expect(page).to have_xpath("//img[contains(@src,'monkey.jpg')]")
    end

    scenario 'prompts user to fill out a form, then displays post' do
      visit '/posts'
      click_link 'Post an image'
      attach_file 'post[image]', "#{Rails.root}/spec/images/monkey.jpg"
      fill_in 'Caption', with: post2.caption
      click_button 'Post image'
      expect(page).to have_content post2.caption
      expect(current_path).to eq '/posts'
      expect(page).to have_xpath("//img[contains(@src,'monkey.jpg')]")
    end
  end
end
