require 'rails_helper'

RSpec.feature "Photo Posting", type: :feature do
  scenario "User can see a button to upload a new photo" do
    visit "/posts"
    expect(page).to have_link("Upload")
  end
  
  # scenario 'posts are displayed newest to oldest' do
  #   sign_up
  #   create_three_new_posts
  #   expect('3').to appear_before('2')
  #   expect('2').to appear_before('1')
  #   expect('3').to appear_before('1')
  # end
end
