require 'rails_helper'

feature 'like pictures' do
  before do
    user = create :user
    sign_in_as(user)
    visit '/pictures'
    add_picture('spec/assets/images/dism.jpg')
  end

  scenario 'a user can like a picture' do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content('1')
  end

end