require 'rails_helper'

RSpec.feature 'liking pictures' do

  before do
    sign_up_1
    add_picture
  end

  scenario 'a user can like a picture on the picture page', js:true do
    visit '/pictures'
    click_link 'Pirate Party!'
    click_link 'Like Pirate Party!'
    expect(page).to have_content('1 like')
  end

  scenario 'a user may only like a picture once' do
    visit '/pictures'
    click_link 'Pirate Party!'
    click_link 'Like Pirate Party!'
    click_link 'Like Pirate Party!'
    expect(page).to have_content '1 like'
    expect(page).to have_content 'Already liked!'
  end

end
