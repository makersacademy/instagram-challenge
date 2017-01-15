require 'rails_helper'
require 'web_helper'

feature 'contributions' do
  context 'no contributions have been added' do
    scenario 'should display a prompt to add a contribution' do
      visit '/contributions'
      expect(page).to have_content 'No contributions yet'
      expect(page).to have_link 'Add a contribution'
    end
  end

  context 'contributions have been added' do
    before do
      sign_up
      create_contribution
    end

    scenario 'display contributions' do
      visit '/contributions'
      expect(page).to have_content 'TEST'
      expect(page).to have_content 'A black cat'
    end
  end

  context 'creating contributions' do
    before do
      @image  = fixture_path + "/test_image.jpg"
    end
    scenario 'prompts user to fill out a form, then displays the new contribution' do
      sign_up
      visit '/contributions'
      click_link 'Add a contribution'
      attach_file 'Image', @image
      fill_in 'Comment', with: 'A black cat'
      click_button 'Create Contribution'
      expect(page).to have_content 'A black cat'
      expect(page).to have_selector("img")
      expect(current_path).to eq '/contributions'
      click_link 'delete'
    end
  end

  context 'display contributions indivisually' do
    let!(:user){ User.create(email: 'test@test.com', username: 'TEST', password: '12345678', password_confirmation: '12345678')}
    let!(:contribution){ Contribution.create(comment: 'A black cat', user_id: user.id) }

    scenario 'lets a user view a contribution' do
      visit '/contributions'
      click_link 'view all'
      expect(page).to have_content 'A black cat'
      expect(current_path).to eq "/contributions/#{contribution.id}"
    end
  end

  context 'editing contributions' do
    before do
      sign_up
      user = User.find_by(email: 'test@example.com')
      Contribution.create(comment: 'A black cat', id:1, user_id: user.id )
    end
    scenario 'let a user edit a contribution' do
      visit '/contributions'
      click_link 'edit'
      fill_in 'Comment', with: 'I met a really beautiful black cat in Portugal'
      click_button 'Save'
      click_link 'view all'
      expect(page).to have_content 'I met a really beautiful black cat in Portugal'
      expect(current_path).to eq '/contributions/1'
    end
  end

  context 'deleting contributions' do
    before do
      sign_up
      user = User.find_by(email: 'test@example.com')
      Contribution.create(comment: 'A black cat', id:1, user_id: user.id )
    end
    scenario 'let a user delete a contribution' do
      visit '/contributions'
      click_link 'delete'
      expect(page).not_to have_content 'A black cat'
      expect(page).to have_content 'Deleted'
    end
  end

end
