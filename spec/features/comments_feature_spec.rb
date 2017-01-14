require 'rails_helper'

feature 'commenting' do
  before {Photograph.create description: 'description'}

  scenario 'allows users to leave a comment using a form' do
    visit '/photographs'
    click_link 'Leave Comment'
    fill_in "Description", with: 'amazing'
    click_button 'submit'

    expect(current_path).to eq '/photographs'
    expect(page).to have_content('amazing')
  end
end
