require 'rails_helper'

feature 'Comments' do
  before {Post.create title: 'Highway'}

  scenario 'Adding a new comment on a post' do
    visit '/posts/'
    click_link 'Comment on Highway'
    fill_in "Comments", with: "Awesome <3"
    click_button 'Leave Comment'
    click_link 'Highway'
    expect(page).to have_content('Awesome <3')
  end
end