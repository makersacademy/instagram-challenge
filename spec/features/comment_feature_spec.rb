require 'rails_helper'
require 'web_helpers'

feature 'comments' do

  context 'a photo has been created' do
    before do
      sign_up
      upload_coffee_photo
    end

    it 'should allow a signed in user to leave a comment' do
      @photo = Photo.find_by(name:"Posh Coffee")
      visit '/'
      click_link('Posh Coffee')
      click_link('New Comment')
      fill_in 'comment[text]', with: "That looks lovely! Where did you get it?"
      click_button("Create Comment")
      # require "pry"; binding.pry
      expect(page).to have_content("Comments")
      expect(page).to have_content("Posh Coffee")
      expect(current_path).to eq "/photos/#{@photo.id}"
    end
  end


end
