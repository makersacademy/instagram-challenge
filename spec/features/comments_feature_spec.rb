require 'rails_helper'

feature 'commenting' do
  before do
    add_new_post
  end

  scenario 'let user state his opinion' do
    visit '/posts'
    click_link 'Comment'
    fill_in 'Opinions', with: 'mouth watering'
    click_button 'Leave Comment'

    expect(current_path).to eq '/posts'
    expect(page).to have_content 'mouth watering'
  end

end
