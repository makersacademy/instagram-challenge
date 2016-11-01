require 'rails_helper'

feature 'tagging posts' do
  before do
    user_sign_up
  end

  it 'displays tags on the posts page' do
    visit '/posts'
    click_link 'New post', match: :first
    fill_in 'Title', with: 'Post with tag'
    fill_in 'Description', with: 'words here'
    page.attach_file("post_image", Rails.root + 'app/assets/images/shadow.JPG')
    fill_in 'Tags', with: '#working, #cool'
    click_button 'Create post'

    expect(page).to have_link '#working'
    expect(page).to have_link '#cool'
  end
end
