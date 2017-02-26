require 'rails_helper'

feature 'posts' do
  context 'no posts have been uploaded' do
    scenario 'should display a prompt to upload a post' do
      visit'/'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_content 'Upload Photo'
    end
  end
end
