feature 'pictures' do

  before(:each) do
    visit '/'
    user_sign_up
  end

  context 'user can post a picture' do

    scenario 'user can post a picture it appears in the main feed' do
      post_picture("Wild ducks")
      expect(page.find('#image_display')['src']).to have_content('duck.jpg')
      expect(page).to have_current_path('/pictures')
      expect(page).to have_content("Wild ducks")
    end

    scenario 'user can post a picture it appears on the individual picture page' do
      post_picture("Wild ducks")
      click_on("Wild ducks")
      expect(page.find('#image_display')['src']).to have_content('duck.jpg')
      expect(page).to have_current_path('/pictures/1')
      expect(page).to have_content("Wild ducks")
    end

  end
end
