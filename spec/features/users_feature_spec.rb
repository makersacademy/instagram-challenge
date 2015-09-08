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

feature 'User sign up' do
  scenario 'should also require user to give an username' do
    visit('/')
    click_link('Sign up')
    fill_in('Username', with: 'test')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'test1234')
    fill_in('Password confirmation', with: 'test1234')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario "cant have the same username" do
    create(:user)
    visit('/')
    click_link('Sign up')
    fill_in('Username', with: 'user')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'test1234')
    fill_in('Password confirmation', with: 'test1234')
    click_button('Sign up')
    expect(page).to have_content('Username has already been taken')
  end
end

feature 'User profile page' do
  let(:user1) { build(:user) }
  let(:user2) { build(:user) }
  let!(:photo1) { create(:photo, user: user1) }
  let!(:photo2) { create(:photo, description: 'Nope', user: user2) }
  before { sign_in_as(user1) }

  scenario "contains user's uploaded photos" do
    visit('/')
    click_link('My profile')
    expect(page).to have_content(photo1.description)
    expect(page).to have_selector(:css, "img[src*='testing.png']")
    expect(page).not_to have_content(photo2.description)
  end

  scenario "contains the uploaded photo's comments" do
    photo1.comments.create(contents: 'Nice', user: user1)
    photo1.comments.create(contents: 'Bad', user: user2)
    visit('/')
    click_link('My profile')
    expect(page).to have_content('Nice')
    expect(page).to have_content('Bad')
  end

  scenario 'can delete a photo' do
    photo1.comments.create(contents: 'Nice', user: user1)
    visit('/')
    click_link('My profile')
    click_link('Delete Photo')
    expect(page).not_to have_content(photo1.description)
    expect(page).not_to have_content('Nice')
    expect(page).to have_content('Photo deleted successfully')
  end

  scenario 'can delete a comment' do
    photo1.comments.create(contents: 'Nice', user: user1)
    visit('/')
    click_link('My profile')
    expect(page).to have_content('Nice')
    click_link('Delete Comment')
    expect(page).not_to have_content('Nice')
  end

  scenario "can only delete comments made by user" do
    photo1.comments.create(contents: 'Bad', user: user2)
    visit('/')
    click_link('My profile')
    expect(page).not_to have_link('Delete Comment')
  end
end
