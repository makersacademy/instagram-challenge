require 'rails_helper'

feature 'Liking images' do

  before do
    myface = Image.create(description: 'My face')
  end

  scenario 'a user can like an image, which updates the image likes count' do
    visit '/'
    click_link 'Like My face'
    expect(page).to have_content('1 like')
  end

end
