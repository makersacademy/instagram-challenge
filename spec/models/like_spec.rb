require 'rails_helper'


feature 'Liking photos' do

  before {Photo.create title:'Awesome sea'}

  context 'Signed in' do
    before {sign_up}
    scenario "User can like a photo, which updates the photo 'like' count" do
      click_link 'Like'
      expect(page).to have_content '1 like'
      expect(page).not_to have_content '0 likes'
    end
  end

  context 'Not signed in' do
    scenario "Does not allow users to like a photo" do
      visit '/photos'
      click_link 'Like'
      expect(page).to have_content '0 likes'
      expect(page).not_to have_content '1 like'
    end
  end

  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

end