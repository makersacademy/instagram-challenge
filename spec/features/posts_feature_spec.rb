feature 'Posts' do
  context 'Users can post to Instagram' do

    before(:each) do
      visit '/'
      user_sign_up
      visit '/'
    end

    scenario 'Users can post pictures to Instagram' do
      click_link 'New Post'
      attach_file 'post_pics', "spec/asset_specs/photos/photo.jpg"
      click_button 'Create Post'
      expect(page).to have_content 'Post was successfully created.'
      expect(page).to have_selector("img")
    end

    scenario 'Users can post captions with their pictures to Instagram' do
      click_link 'New Post'
      attach_file 'post_pics', "spec/asset_specs/photos/photo.jpg"
      fill_in 'post_caption', with: 'A lovely photo from my holiday'
      click_button 'Create Post'
      expect(page).to have_content 'Post was successfully created.'
      expect(page).to have_content 'A lovely photo from my holiday'
    end

    scenario 'Username is shown with a user picture' do
      create_new_post
      visit '/'
      expect(page).to have_content "test1"
    end
  end

  context 'Only Users can make changes to their posts' do
    scenario 'Users can only edit and delete their own pictures' do
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

  context 'Only Users can post to Instagram' do
    scenario 'Users must sign up to use Instagram' do
      visit '/'
      expect(page).to have_content 'Sign In'
      click_link 'New Post'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end
end
