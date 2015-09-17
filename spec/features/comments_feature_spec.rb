require 'rails_helper'

feature 'comments' do

  before(:each) do
    user = create(:user)
    sign_in(user)
    visit current_path
    upload_photo
  end

  scenario 'photos have a comment field' do
    visit photos_path
    expect(page).to have_button "submit"
  end

  scenario 'I can see other comments on photos' do
    visit photos_path
    fill_in 'comment[content]', with: "test comment\n"
    click_button 'submit'
    expect(page).to have_content "test comment"
  end
end
