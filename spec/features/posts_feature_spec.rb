require 'rails_helper'

feature 'posts' do
  context 'no posts' do
    scenario 'should display a prompt to post an image' do
      visit '/'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post an image'
    end
  end

  context 'post in DB' do

    let!(:post1) { create(:post) }
    let(:post2) { build(:post) }
    let!(:user) { create(:user) }

    before do
      user_sign_in(user)
    end

    scenario 'display posts' do
      visit '/'
      expect(page).to have_content post1.caption
      expect(page).to have_xpath("//img[contains(@src,'monkey.jpg')]")
    end

    context 'creating posts', js: true, focus: true do
      scenario 'user can post image with caption' do
        byebug
        click_link 'Post an image'
        attach_file 'post[image]', "#{Rails.root}/spec/assets/images/monkey.jpg"
        fill_in 'Caption', with: post2.caption
        click_button 'Post image'
        expect(page).to have_content post2.caption
        expect(current_path).to eq '/posts'
        expect(page).to have_xpath("//img[contains(@src,'monkey.jpg')]")
      end
      scenario 'needs an image to create a post' do
        # visit '/'
        click_link 'Post an image'
        fill_in 'Caption', with: post2.caption
        click_button 'Post image'
        expect(page).to have_content("Image can't be blank")
      end
      scenario 'uploaded file must be image', focus: true do
        # visit '/'
        click_link 'Post an image'
        attach_file 'post[image]', "#{Rails.root}/spec/assets/WordDoc.docx"
        fill_in 'Caption', with: post2.caption
        click_button 'Post image'
        expect(page).to have_content('Image content type is invalid')
      end
    end

    context 'showing posts' do
      scenario 'user can view post' do
       visit '/'
       click_link "post#{post1.id}"
       expect(page).to have_xpath("//img[contains(@src,'monkey.jpg')]")
       expect(page).to have_content post1.caption
       expect(current_path).to eq "/posts/#{post1.id}"
       expect(page).not_to have_link 'Post an image'
      end
    end

    context 'updating posts' do
      scenario 'user can edit caption' do
       visit '/'
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
        visit '/'
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
