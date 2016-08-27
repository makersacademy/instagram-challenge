require 'rails_helper'

feature 'adding love to images' do
  before do
    my_pic = Image.create(name: 'On holiday')
  end

  scenario 'a user can love an image which will increase the visual count' do
    visit '/'
    click_link 'Love this'
    expect(page).to have_content('1 Love')
  end

end
