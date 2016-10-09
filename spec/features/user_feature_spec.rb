feature 'users' do

  context 'user can create an account' do

    scenario 'should allow a user to click sign up on top nav' do
      visit '/'
      user_sign_up
      expect(page).to have_content 'johnny@appleseed.com'
      expect(page).to have_link 'Post'
    end

  end

  context 'user can log in and log out' do

    scenario 'should allow a user to log out using the top nav' do
      visit '/'
      user_sign_up
      user_log_out
      expect(page).not_to have_content 'johnny@appleseed.com'
      expect(page).not_to have_link 'Post'
    end

    scenario 'should allow user to log in using top nav' do
      visit '/'
      user_sign_up
      user_log_out
      user_log_in
      expect(page).to have_content 'johnny@appleseed.com'
    end

  end

end
