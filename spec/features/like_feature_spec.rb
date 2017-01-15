require 'rails_helper'
require 'web_helpers'

feature 'likes' do

  context 'a photo has been added' do

    before do
      sign_up
      upload_coffee_photo
    end

    it 'should let you like a photo' do
      @photo = Photo.find_by(name:"Posh Coffee")
      visit '/'
      click_link("#{@photo.name}")
      click_link('Like')
      expect(page).to have_content("1 Like")
      expect(current_path).to eq "/photos/#{@photo.id}"
    end

    it 'should only let you like a photo once' do
      @photo = Photo.find_by(name:"Posh Coffee")
      visit '/'
      click_link("#{@photo.name}")
      click_link('Like')
      expect{ click_link('Like') }.to_not change{Like.count}
      expect(current_path).to eq "/photos/#{@photo.id}"
    end

  end

end
