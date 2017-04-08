feature 'Posts' do
  context 'Users can post to Instagram' do

    before(:each) do
      visit '/'
      user_sign_up
    end

    scenario 'Users can post pictures to Instagram' do
      visit '/'
      click_link 'New Post'
      fill_in 'post_picture', with: 'http://photodoto.com/wp-content/uploads/2014/09/1-instagram-tips-for-photography-business.jpg'
      click_button 'Create Post'
      expect(page).to have_content 'Post was successfully created.'
      expect(page).to have_content 'http://photodoto.com/wp-content/uploads/2014/09/1-instagram-tips-for-photography-business.jpg'
    end

    scenario 'Users can post captions with their pictures to Instagram' do
      visit '/'
      click_link 'New Post'
      fill_in 'post_picture', with: 'http://photodoto.com/wp-content/uploads/2014/09/1-instagram-tips-for-photography-business.jpg'
      fill_in 'post_caption', with: 'A lovely photo from my holiday'
      click_button 'Create Post'
      expect(page).to have_content 'Post was successfully created.'
      expect(page).to have_content 'A lovely photo from my holiday'
    end
  end

  context 'Users pictures are associated with their accounts' do

    let!(:user){ User.create(email: 'test45@example.com', username: 'test45', password: '1234567') }

    scenario 'User ID is shown with their pictures' do
      visit '/'
      click_link 'Sign In'
      fill_in :user_username, with: 'test45'
      fill_in :user_email, with: 'test45@example.com'
      fill_in :user_password, with: '1234567'
      click_button 'Log in'
      click_link 'New Post'
      fill_in 'post_picture', with: 'http://photodoto.com/wp-content/uploads/2014/09/1-instagram-tips-for-photography-business.jpg'
      fill_in 'post_caption', with: 'A lovely photo from my holiday'
      click_button 'Create Post'
      visit '/'
      expect(page).to have_content "#{user.id}"
    end

    scenario 'Users can only edit and delete their own pictures' do
      visit '/'
      user_sign_up
      create_new_post
      visit '/'
      expect(page).to have_content 'Edit'
      expect(page).to have_content 'Destroy'
      click_link 'Sign Out'
      visit '/'
      second_user_sign_up
      expect(page).not_to have_content 'Edit'
      expect(page).not_to have_content 'Destroy'
    end
  end
end
