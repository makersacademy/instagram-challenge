require 'rails_helper'

feature 'liking photos' do

  let(:user) { create :user }

  before do
    @image = user.images.create caption: 'Test caption'
  end

  scenario 'a user can like an image' do
    visit '/'
    click_link 'Like!'
    expect(page).to have_content('1 like')
  end
end
