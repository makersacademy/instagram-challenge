require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    scenario 'should see a sign in link and a sign up link' do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario 'should not see sign out link' do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'user signed in on the homepage' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@test.com')
      fill_in('Password', with: 'test1234')
      fill_in('Password confirmation', with: 'test1234')
      click_button('Sign up')
    end

    scenario 'should see sign out link' do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    scenario 'should not see a sign in or a sign up link' do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end

feature 'User profile page' do
  let(:user1) { build(:user) }
  let(:user2) { build(:user) }
  let!(:photo1) { create(:photo, user: user1) }
  let!(:photo2) { create(:photo, description: 'Nope', user: user2) }
  before { sign_in_as(user1) }

  scenario "contains only user's uploaded photos" do
    visit('/')
    click_link('My profile')
    expect(page).to have_content(photo1.description)
    expect(page).to have_selector(:css, "img[src*='testing.png']")
    expect(page).not_to have_content(photo2.description)
  end

  scenario "contains only user's comments" do
    photo1.comments.create(contents: 'Nice', user: user1)
    photo1.comments.create(contents: 'Bad', user: user2)
    visit('/')
    click_link('My profile')
    expect(page).to have_content('Nice')
    expect(page).not_to have_content('Bad')
  end

  scenario 'can delete a comment' do
    photo1.comments.create(contents: 'Nice', user: user1)
    visit('/')
    click_link('My profile')
    expect(page).to have_content('Nice')
    click_link('Delete')
    expect(page).not_to have_content('Nice')
  end
end
