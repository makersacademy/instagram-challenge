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

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content post1.caption
      expect(page).to have_xpath("//img[contains(@src,'monkey.jpg')]")
    end

    context 'creating posts' do
      scenario 'user can post image with caption' do
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

    context 'showing posts' do
      scenario 'user can view post' do
       visit '/posts'
       click_link "post#{post1.id}"
       expect(page).to have_xpath("//img[contains(@src,'monkey.jpg')]")
       expect(page).to have_content post1.caption
       expect(current_path).to eq "/posts/#{post1.id}"
       expect(page).not_to have_link 'Post an image'
      end
    end

    context 'updating posts' do
      scenario 'user can edit caption' do
       visit '/posts'
       click_link "post#{post1.id}"
       click_link 'Edit caption'
       fill_in 'Caption', with: post2.caption
       click_button 'Update caption'
       expect(page).to have_content post2.caption
       expect(current_path).to eq '/posts'
      end
    end

    context 'deleting restaurants' do
      scenario 'removes a restaurant when a user clicks a delete link' do
        visit '/posts'
        click_link "post#{post1.id}"
        click_link 'Delete post'
        expect(page).not_to have_xpath("//img[contains(@src,'monkey.jpg')]")
        expect(page).not_to have_content post1.caption
        expect(current_path).to eq '/posts'
        expect(page).to have_content 'Post deleted successfully'
      end
    end
  end
end
