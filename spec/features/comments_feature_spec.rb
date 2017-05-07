require 'rails_helper'

feature 'commenting' do
  before { Scene.create title: 'Mountain', id: 1 }

  scenario 'allows users to leave a comment using a form' do
    visit '/scenes'
    click_link 'Comment'
    fill_in "Thoughts", with: "What a mountain!"
    click_button 'Leave comment'
    expect(current_path).to eq '/scenes'
    click_link 'Mountain'
    expect(page).to have_content 'What a mountain!'
  end
end
