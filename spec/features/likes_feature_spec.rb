require 'rails_helper'

feature 'likes' do
  before do
    @picture = create(:picture)
  end

  scenario 'a user can like a picture, which updates the picture like count' do
    visit '/pictures'
    click_link 'Like Picture'
    expect(page).to have_content('1 like')
  end
end
