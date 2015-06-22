require 'rails_helper'

feature 'commenting' do
  before { Picture.create title: "test"}

  scenario 'a user can add a comment to the picture' do
    visit '/'
    click_link 'Add a comment'
    fill_in 'Comment', with: 'beautiful picture'
    click_button 'Leave comment'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'beautiful picture'
  end
end
