require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(postcomment: 'My first pic')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('My first pic')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating pictures' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end
  scenario 'prompts user to fill out a form, then displays the new picture' do
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'picture[postcomment]', with: 'My first selfie'
    click_button 'Create Picture'
    expect(page).to have_content 'My first selfie'
    expect(current_path).to eq '/pictures'
  end

  context 'an invalid picture' do
    it 'does not let you submit a post comment that is too long' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'picture[postcomment]', with: '111111111122222222223333333333' +
      '4444444444555555555566666666667777777777888888888899999999990000000000' +
      '1111111111222222222233333333334444444444555555555566666666667777777777' +
      '8888888888999999999900000000001111111111222222222233333333334444444444' +
      '55555555556666666666' + 'extra characters!'
      click_button 'Create Picture'
      expect(page).not_to have_content 'extra characters!'
      expect(page).to have_content 'error'
    end
  end
end

context 'editing pictures' do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    id = User.first.id
    Picture.create postcomment: 'Another pic', user_id: id
  end
  scenario 'let a user edit a picture' do
   visit '/pictures'
   click_link 'Edit Picture'
   fill_in 'picture[postcomment]', with: 'Another great pic'
   click_button 'Update Picture'
   expect(page).to have_content 'Another great pic'
   expect(current_path).to eq '/pictures'
  end

end

context 'deleting pictures' do

  # before {Picture.create postcomment: 'Holiday pic'}
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    id = User.first.id
    Picture.create postcomment: 'Holiday pic', user_id: id
  end
  scenario 'removes a picture when a user clicks a delete link' do
    visit '/pictures'
    click_link 'Delete Picture'
    expect(page).not_to have_content 'Holiday pic'
    expect(page).to have_content 'Picture deleted successfully'
  end

  scenario 'removes a picture and deletes it\'s comments' do
      visit '/pictures'
      click_link 'Add a Comment'
      fill_in "comment[thoughts]", with: "Pretty Good."
      click_button 'Leave Comment'
      expect(current_path).to eq '/pictures'
      expect(page).to have_content("Pretty Good.")
      click_link 'Delete Picture'
      expect(page).not_to have_content("Pretty Good.")
    end

end

end
