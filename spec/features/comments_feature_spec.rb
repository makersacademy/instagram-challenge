require 'rails_helper'

feature 'commenting' do
  let!(:photo) { create(:photo) }
  let!(:user) { build(:user) }
  before { sign_in_as(user) }

  scenario 'allows users to leave comments using a form' do
    visit("/photos/#{photo.id}")
    fill_in('comment[contents]', with: 'looking good')
    click_button('Comment')
    expect(current_path).to eq("/photos/#{photo.id}")
    expect(page).to have_content('looking good')
  end
end
