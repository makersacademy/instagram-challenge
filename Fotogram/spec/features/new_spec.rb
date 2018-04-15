require 'rails_helper.rb'

feature 'new' do
  scenario 'Display a form to post a new image' do
    visit'/'
    click_link 'New Post'
    expect(page). to have_content("Description")
  end
end
