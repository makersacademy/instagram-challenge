require 'rails_helper'

feature 'likes' do

  before do
    sign_up
    add_picture
  end

  context 'user logged in' do
    it 'lets a user "like" a picture' do
      click_link 'Like'
      expect(page).to have_content('1 like')
    end
  end

end
