require 'rails_helper'

feature "comments" do
  context 'when not logged in' do
    scenario 'a visitor cannot leave a comment' do
      Picture.create(name:'test',
                     avatar_file_name: 'test.jpg',
                     avatar_file_size: '10',
                     avatar_content_type: 'image/jpeg')
      visit '/pictures'
      click_link 'comment'
      expect(page).to have_content 'Log in'
    end
  end

  context 'when logged in' do
    before do
      sign_up
      new_picture
      leave_comment
    end

    scenario 'allows users to leave a comment using a form' do
      expect(current_path).to eq '/pictures'
      expect(page).to have_content('so so')
    end

    scenario 'allows users to delete a comment if it belongs to them' do
      visit '/pictures'
      click_link 'delete comment'
      expect(page).not_to have_content 'delete comment'
      expect(page).to have_content 'Comment deleted successfully'
    end

    def sign_up
      visit '/pictures'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@makers.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button 'Sign up'
    end

    def new_picture
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Avatar', 'spec/features/test.jpg'
      fill_in 'Name', with: 'test'
      click_button 'Create Picture'
    end

    def leave_comment
      visit '/pictures'
      click_link 'comment'
      fill_in "Thoughts", with: "so so"
      click_button 'Post comment'
    end
  end
end

# no test for 'doesnt allow a comment to be deleted if it does not belong to the user' as it requires a whole new user to sign in.
# havent done the test for 'not able to delete a comment' when not logged in.
