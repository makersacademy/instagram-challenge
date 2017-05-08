require 'rails_helper'

feature 'leaving comments' do
  before do
    sign_up
    add_experience
  end

  scenario 'allows a signed in user to leave a review'  do
    within('.experience') {
      fill_in "Comment", with: 'Awesome powder'
      click_button "Leave comment"
      expect(page).to have_content "Awesome powder"
    }
    expect(current_path).to eq '/'
    # within('.experience') { expect(page).to have_content "Awesome powder" }
  end
end
