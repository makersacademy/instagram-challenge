require 'rails_helper'

feature 'commenting an image' do

  let!(:sunday){ Image.create(description: 'Sunday') }

  scenario 'allows users to leave comments using a form' do
    user_sign_up
    visit "/images/#{sunday.id}"
    click_link 'Comment'
    fill_in 'Thoughts', with: 'Nice photo!'
    click_button 'Comment'

    expect(current_path).to eq "/images/#{sunday.id}"
    expect(page).to have_content 'Nice photo!'
  end
end
