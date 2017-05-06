require 'rails_helper'

feature 'commenting' do
  before do
    create_picture
  end

  scenario 'allows user to leave a comment' do
    visit root_path
    click_link "Leave comment on 'Me'"
    fill_in "comment[thoughts]", with: 'Looking good!'
    click_button 'Leave comment'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'Looking good!'
  end
end
