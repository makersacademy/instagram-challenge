require 'rails_helper'

feature 'liking pictures' do
  before do
    Picture.create(caption: 'a nice picture', image: File.new(Rails.root.join('spec','images','img.jpg')))
  end

  scenario 'a user can like a picture, which updates the like count', js:true do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content '1 like'
  end

  scenario 'a user can unlike a picture', js:true do
    visit '/pictures'
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content '0 likes'
  end
end