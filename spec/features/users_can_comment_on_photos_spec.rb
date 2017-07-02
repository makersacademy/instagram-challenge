require 'rails_helper'

RSpec.feature "User can comment on photos" do

  before(:each) { create_photo }

  scenario "user visits the photos page" do
    visit photos_url
    click_button 'Comment'
    expect(current_path).to match("/photos/#{@photo.id}")
    fill_in 'Text', with: 'Lovely photo!'
    click_button 'Create Comment'
    expect(page).to have_content('Lovely photo!')
  end
end
