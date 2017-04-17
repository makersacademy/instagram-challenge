require 'rails_helper'

feature 'comments' do
  before(:each) do
    @user = create(:user)
    sign_in(@user)
    create_image
  end
  scenario 'Allows a user to leave a comment with a form' do
    visit '/images'
    click_link 'Add a comment'
    fill_in "Thoughts", with: "Awesome Picture"
    click_button 'Create Comment'
    expect(page).to have_content('Awesome Picture')
    expect(current_path).to eq('/images')
  end
  scenario 'Allows a user to delete own comments' do
    visit '/images'
    click_link 'Add a comment'
    fill_in 'Thoughts', with: "Nice Pic"
    click_button 'Create Comment'
    click_link 'Delete comment'
    expect(page).not_to have_content('Nice Pic')
    expect(current_path).to eq('/images')
  end
end
