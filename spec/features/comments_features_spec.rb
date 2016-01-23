feature 'Leaving comments' do

  before do
    sign_up
    post_a_picture
    leave_a_comment
  end

  context 'creating a comment' do

    scenario 'allows a user to leave a comment using a form' do
      expect(current_path).to eq '/pictures'
      expect(page).to have_content 'What a fantastic cat'
    end

  end

  context 'displaying a comment' do

    scenario 'shows users username before comment' do
      expect(page).to have_content('Wynndow What a fantastic cat')
    end
  end

  context 'deleting comments' do

    scenario 'comment can be deleted' do
      click_link 'Delete comment'
      expect(page).not_to have_content 'What a fantastic cat'
    end

    scenario 'comment can not be deleted if not the user\'s' do
      click_link 'Sign out'
      sign_up(email: 'different@user.com', username: 'Different')
      visit '/pictures'
      click_link 'Delete comment'
      expect(page).to have_content 'What a fantastic cat'
      expect(page).to have_content 'Sorry, you can only delete your own comments'
    end

    scenario 'comments are deleted if it\'s picture is deleted' do
      visit '/pictures'
      expect{ click_link 'Delete picture' }.to change{ Comment.count }.by(-1)
    end

  end

end
