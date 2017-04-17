require 'rails_helper'

feature 'likes' do
  before do
    @user = create(:user)
    sign_in(@user)
    create_image
  end
  scenario 'A user can like an image, which will update the likes count', js: true do
    visit('/images')
    click_link('👍')
    expect(page).to have_content('1 like')
  end
end
