require 'rails_helper'

feature 'comments' do
  before do
    visit '/'
    click_link 'Add a photo'
    fill_in 'Description', with: 'Another test description'
    page.attach_file("photo_image", Rails.root + 'app/assets/images/burger_king.jpg')
    click_button 'Add Photo'
  end

  scenario 'users can comment on each photo' do
    visit '/'
    click_link 'Add Comment'
    fill_in 'Description', with: "This is my comment!"
    click_button 'Add Comment'
    expect(page).to have_content "This is my comment!"
    find(:xpath, "//a/img[@alt='Burger king']/..").click
    expect(page).to have_content "This is my comment!"
  end
end
