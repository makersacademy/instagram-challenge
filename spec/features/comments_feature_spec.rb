feature 'Comments' do
  context 'Users can leave comments' do

    before(:each) do
      visit '/'
      user_sign_up
      create_new_post
      visit '/'
    end

    scenario 'Users can leave comments on any post' do
      click_link 'Comment'
      fill_in 'comment_comment', with: 'Love this photo'
      click_button 'Create Comment'
      expect(page).to have_content 'Love this photo'
    end

    scenario 'Usernames are shown with a user comment' do
      click_link 'Comment'
      fill_in 'comment_comment', with: 'Love this photo'
      click_button 'Create Comment'
      click_link 'Sign Out'
      second_user_sign_up
      visit '/'
      expect(page).to have_content 'Love this photo'
      expect(page).to have_content 'test1'
    end

    scenario 'Usernames on comments are links to profile pages' do
      click_link 'Comment'
      fill_in 'comment_comment', with: 'Love this photo'
      click_button 'Create Comment'
      within(".comment") do
        click_link("test1")
      end
      expect(page).to have_content 'A lovely photo from my holiday'
    end
  end

  context 'Only Users can fully use Instagram' do

    before(:each) do
      visit '/'
      user_sign_up
      create_new_post
      visit '/'
      click_link 'Sign Out'
    end

    scenario 'Only Users can post comments' do
      visit '/'
      expect(page).to have_content 'Sign In'
      click_link 'Comment'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end
end
