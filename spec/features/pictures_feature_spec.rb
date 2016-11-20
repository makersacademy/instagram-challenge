require 'rails_helper'

feature 'adding pictures' do
  before { Picture.create title: 'Another cute pic' }

  scenario 'allows users to add a new picture using a form' do
    sign_up_and_sign_in
    create_a_gallery
    visit_a_gallery
    click_link 'Add Picture'
    fill_in "Title", with: "Oh my god!"
    click_button 'Create Picture'
    expect(current_path).to eq '/galleries'
    expect(page).to have_content('Oh my god!')
  end

end
