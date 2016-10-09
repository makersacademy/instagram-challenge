feature 'pictures' do

  before(:each) do
    visit '/'
    user_sign_up
  end

  context 'user can post a picture' do

    scenario 'user clicks post and adds a picture' do
      post_picture("Amazing Mountains")
      expect(page).to have_current_path('/pictures')
      expect(page).to have_content("Amazing Mountains")
    end

    scenario 'user can post a picture and visit it' do
      post_picture("Wild ducks")
      click_on("Wild ducks")
      expect(page).to have_current_path('/pictures/1')
      expect(page).to have_content("Wild ducks")
    end

  end
end
