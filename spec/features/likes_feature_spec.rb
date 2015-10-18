require 'rails_helper'

feature 'liking pictures' do

  let(:user){build :user}

  before do
    sign_up(user)
    add_picture('tower_bridge')
  end

  scenario 'a user can like a picture, which updates the picture like count' do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
