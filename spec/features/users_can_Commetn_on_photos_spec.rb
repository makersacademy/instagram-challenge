require 'rails_helper'

RSpec.feature "User can see photos" do

  before(:each) { create_photo }

  scenario "user visits the photos page" do
    sign_in
    visit photos_url
    click_button 'Comment'
    fill_in 'comment_text', with: 'Lovely photo!'
    expect(path).to be('/photos')
    expect(page).to have_content('Lovely photo!')
  end
end
