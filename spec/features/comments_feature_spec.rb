require 'rails_helper'

feature 'commenting' do
  let(:photo) { create(:photo) }
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: 'test2@test.com') }
  before { sign_in_as(user) }

  scenario 'allows users to leave comments using a form' do
    visit("/photos/#{photo.id}")
    fill_in('comment[contents]', with: 'looking good')
    click_button('Comment')
    expect(current_path).to eq("/photos/#{photo.id}")
    expect(page).to have_content('looking good')
  end

  scenario 'can delete a comment created by user' do
    photo.comments.create(contents: 'Nice', user: user)
    visit('/')
    click_link('Testing')
    expect(page).to have_content('Nice')
    click_link('Delete Comment')
    expect(page).not_to have_content('Nice')
  end

  scenario "cannot delete another user's comment" do
    photo.comments.create(contents: 'Nice', user: user2)
    visit('/')
    click_link('Testing')
    expect(page).to have_content('Nice')
    expect(page).not_to have_link('Delete Comment')
  end
end
