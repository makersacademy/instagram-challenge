require 'rails_helper'

feature 'a logged in user should be able to dig a post' do

  before do
    sign_up('bob')
    new_post('This is a post')
  end

  context 'when no user is logged in' do

    it 'should not display a link to dig this post' do
      click_link('Sign out')
      expect(page).not_to have_link('dig this Snapshot!')
    end

  end

  context 'when a user is logged in' do

    it 'should not allow the poster to dig their own Snapshot' do
      expect(page).not_to have_link('Dig this Snapshot!')
    end

    it 'should display a link to dig this post' do
      click_link('Sign out')
      sign_up('jim')
      expect(page).to have_link('Dig this Snapshot!')
    end

    it 'should redirect to the same page once clicked' do
      click_link('Sign out')
      sign_up('jim')
      click_link('Dig this Snapshot!')
      expect(current_path).to eq('/')
    end

    it 'should add to the dig count once clicked' do
      click_link('Sign out')
      sign_up('jim')
      click_link('Dig this Snapshot!')
      expect(page).to have_content('Digged 1 time')
    end

    it 'should allow a user to dig a post only once' do
      click_link('Sign out')
      sign_up('jim')
      click_link('Dig this Snapshot!')
      expect(page).not_to have_link('Dig this Snapshot!')
    end

    it 'should increment the dig count', js: true do
      click_link('Sign out')
      sign_up('jim')
      click_link('Dig this Snapshot!')
      expect(page).to have_content("Digged 1 time")
    end

  end

end
