require 'rails_helper'

describe 'Myphotos' do
  context 'user is logged in' do
    scenario 'displays current users photos' do
      sign_up
      upload_photo
      expect(current_path).to eq "/photos/#{Photo.last.id}"
    end
  end
end 
