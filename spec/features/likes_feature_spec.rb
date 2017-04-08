feature 'Likes' do
  context 'Users can show their appreciation for pictures' do
    scenario 'Users can like posts' do
      user_sign_up
      create_new_post
      visit '/'
      click_link 'Like'
      expect(page).to have_content '1 Like'
    end
  end
end
