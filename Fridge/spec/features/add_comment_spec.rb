require 'rails_helper'

feature 'Adding comments' do
  scenario 'Logged in user adds a comment' do
    sign_up
    upload_photo
    fill_in('comment[content]', :with => 'test comment')
    expect(current_path).to eq('/photos')
    expect(page.status_code).to eq(200)
    expect(page.all('.comments')[0]).to have_content('test comment')
  end
  # scenario 'not logged in user cannot add a comment' do
  # end
end
