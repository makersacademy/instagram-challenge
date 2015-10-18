require 'rails_helper'

context 'photos have been added' do
  before do
    Photo.create(title: 'Test Photo')
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    Photo.create(title: 'Test Photo')
  end

  scenario 'should display a prompt to add a comment' do
    visit '/photos'
    click_link 'Add photo'
    fill_in('Title', with: 'Test Photo')
    attach_file('Image', 'spec/files/images/testimage.jpg')
    click_button 'Create Photo'
    expect(page).to have_content('Add Comment')
  end

  scenario 'should display a comment on the photos page when added' do
    visit '/photos'
    click_link 'Add photo'
    fill_in('Title', with: 'Test Photo')
    attach_file('Image', 'spec/files/images/testimage.jpg')
    click_button 'Create Photo'
    click_link('Add Comment')
    fill_in('Comment', with: 'What a lovely photo')
    click_button('Create Comment')
    expect(page).to have_content('What a lovely photo')
  end

  xscenario 'should display a comment on the photos page in descending created order' do
    visit '/photos'
    click_link 'Add photo'
    fill_in('Title', with: 'Test Photo')
    attach_file('Image', 'spec/files/images/testimage.jpg')
    click_button 'Create Photo'
    click_link('Add Comment')
    fill_in('Comment', with: 'What a lovely photo')
    click_button('Create Comment')
    click_link('Add Comment')
    fill_in('Comment', with: 'What a lovely photo2')
    click_button('Create Comment')
    expect('What a lovely photo2').to appear_before('What a lovely photo')

  end



  context 'The user is not logged in' do
    scenario 'Users who are not logged in should not be able to add a comment' do
      visit '/photos'
      click_link 'Add photo'
      fill_in('Title', with: 'Test Photo')
      attach_file('Image', 'spec/files/images/testimage.jpg')
      click_button 'Create Photo'
      click_link('Add Comment')
      fill_in('Comment', with: 'What a lovely photo')
      click_button('Create Comment')
      expect(page).to have_content('What a lovely photo')
    end
  end




end
