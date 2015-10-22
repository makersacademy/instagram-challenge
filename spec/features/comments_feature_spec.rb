require 'rails_helper'

feature 'Comments' do

  before(:each) do
    @user = create(:user)
    @user2 = create(:user, username:'some_user', email: 'test2@email.com')
  end

  context 'commenting on a picture' do

    scenario 'cannot add a comment when not logged in' do
      @user.pictures.create(caption: 'coding at home', name: 'Nightlife', image_file_name: 'nightlife.png')
      visit '/pictures'
      expect(page).not_to have_link 'Comment on Nightlife'
    end

    scenario 'can add a comment when logged in' do
      @user.pictures.create(caption: 'coding at home', name: 'Nightlife', image_file_name: 'nightlife.png')
      visit '/pictures'
      sign_in(@user2)
      expect(page).to have_link 'Comment on Nightlife'
    end

  end

end
