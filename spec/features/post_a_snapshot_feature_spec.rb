require 'rails_helper'

feature 'posting a Snapshot' do

  context 'uploading a photo' do

    it 'should display the photo' do
      sign_up('test')
      click_link 'Add a new Snapshot!'
      fill_in('Title', with: "Rails Week")
      attach_file 'Upload your Snapshot!', Rails.root + 'spec/rails.jpg'
      click_button 'Post your Snapshot!'
      expect(page.find('#post-RailsWeek-image-medium')['src']).to include('rails.jpg')
    end

    scenario 'not uploading an image of the restaurant uses default' do
      sign_up('test')
      click_link 'Add a new Snapshot!'
      fill_in('Title', with: "Rails Week")
      click_button 'Post your Snapshot!'
      expect(page.find('#post-RailsWeek-image-medium')['src']).to include('missing.png')
    end

  end

end
