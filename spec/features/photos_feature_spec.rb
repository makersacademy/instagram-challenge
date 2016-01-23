require 'rails_helper'

feature 'photos' do
  scenario 'should display a prompt to add a photo' do
    visit '/photos'
    expect(page).to have_content 'Upload a photo'
  end
end
