require 'rails_helper'

feature 'Tags' do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:image){ FactoryGirl.create(:image, user_id: user.id) }

  scenario 'cannot be created by users who are not logged in' do
    visit "/images/#{image.id}"
    fill_in 'tag_name', with: 'animal'
    click_button 'Create Tag'
    expect(current_url).to have_content '/users/sign_in'
  end

  scenario 'logged in users can tag images' do
    login_as(user, :scope => :user)
    visit "/images/#{image.id}"
    fill_in 'tag_name', with: 'animal'
    click_button 'Create Tag'
    expect(page).to have_content 'animal'
  end

  scenario 'tags show all the images they are associated with' do
    tag = image.tags.create(name: 'animal')
    visit "/tags/#{tag.id}"
    expect(page).to have_selector 'img[src*="fatty.jpg"]'
  end

end
