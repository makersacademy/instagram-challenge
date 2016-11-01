require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'displays a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'New post'
    end
  end

  context 'when user is signed in' do
    before { user_sign_up }

    context 'creating posts' do
      scenario 'prompts user to fill out a form, then displays the new post' do
        visit '/posts'
        click_link 'New post', match: :first
        fill_in 'Title', with: 'First post'
        fill_in 'Description', with: 'great'
        page.attach_file("post_image", Rails.root + 'app/assets/images/shadow.JPG')
        click_button 'Create Post'
        expect(page).to have_content 'First post'
        expect(current_path).to eq '/posts'
      end

      it 'does not allow posts with a title less than 3 characters' do
        visit '/posts'
        click_link 'New post', match: :first
        fill_in 'Title', with: 'aa'
        click_button 'Create Post'
        expect(page).not_to have_css 'h2', text: 'aa'
        expect(page).to have_content 'error'
      end

      it "does not allow posts without an image" do
        visit '/posts'
        click_link 'New post', match: :first
        fill_in 'Title', with: 'valid title'
        click_button 'Create Post'
        expect(page).not_to have_css 'h2', text: 'valid title'
        expect(page).to have_content 'error'

      end
    end

    context 'viewing posts' do
      scenario 'lets a user view a post' do
       create_post
       visit '/posts'
       click_link 'First post'
       expect(page).to have_content 'First post'
      end
    end

    context 'editing posts' do
      before { create_post }

      scenario 'let a user edit a post' do
       visit '/posts'
       click_link 'Edit First post'
       fill_in 'Title', with: 'Updated First post'
       fill_in 'Description', with: 'even more great'
       page.attach_file("post_image", Rails.root + 'app/assets/images/shadow.JPG')
       click_button 'Create Post'
       expect(page).to have_content 'Updated First post'
       expect(current_path).to eq '/posts'
      end
    end

    context 'deleting posts' do
      before { create_post }

      scenario 'removes a post when a user clicks a delete link' do
        visit '/posts'
        click_link 'Delete First post'
        expect(page).not_to have_content 'First post'
        expect(page).to have_content 'Post deleted successfully'
      end

    end
end

  context 'when user is not signed in' do
   scenario 'cannot create a post' do
     visit '/posts'
     click_link 'New post'
     expect(current_path).to eq '/users/sign_in'
   end

   scenario 'cannot edit a post' do
     user_sign_up
     create_post
     user_sign_out
     visit '/posts'
     expect(page).not_to have_content 'Edit First post'
     expect(current_path).to eq '/posts'
   end

   scenario 'cannot delete a post' do
     user_sign_up
     create_post
     user_sign_out
     visit '/posts'
     expect(page).not_to have_content 'Delete First post'
     expect(current_path).to eq '/posts'
   end
  end

  context 'when another user is signed in' do
    before do
      user_sign_up
      create_post
      user_sign_out
      second_user_sign_up
    end

   scenario "cannot edit another user's post" do
     visit '/posts'
     expect(page).not_to have_content 'Edit First post'
     expect(current_path).to eq '/posts'
   end

   scenario "cannot delete another user's post" do
     visit '/posts'
     expect(page).not_to have_content 'Delete First post'
     expect(current_path).to eq '/posts'
   end
  end


end
