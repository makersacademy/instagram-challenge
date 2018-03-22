require 'rails_helper'

feature 'Adding comments' do

  before(:each) do
    User.delete_all
  end

  scenario 'Logged in user adds a comment' do
    sign_up
    upload_photo
    fill_in('comment[content]', :with => 'test comment')
    click_on 'Submit'
    expect(current_path).to eq('/photos')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('testusername test comment')
  end
  scenario 'Not logged in user doesnt see the add comment form' do
    visit('/')
    expect(page).not_to have_content('Submit')
  end
end
