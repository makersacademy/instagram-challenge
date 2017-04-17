require 'rails_helper'

feature 'commenting' do

  let(:user){ build :user }
  let(:user2){ build :user2 }

  before do
    sign_up(user)
  end

  context 'photos have been added' do
    before do
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

    scenario 'should display the time ago a comment has added' do
      visit '/photos'
      click_link 'Add photo'
      fill_in('Title', with: 'Test Photo')
      attach_file('Image', 'spec/files/images/testimage.jpg')
      click_button 'Create Photo'
      click_link('Add Comment')
      fill_in('Comment', with: 'What a lovely photo')
      click_button('Create Comment')
      expect(page).to have_content('less than a minute ago')
    end

    scenario 'should display the name of the user who added the comment' do
      visit '/photos'
      click_link 'Add photo'
      fill_in('Title', with: 'Test Photo')
      attach_file('Image', 'spec/files/images/testimage.jpg')
      click_button 'Create Photo'
      click_link('Add Comment')
      fill_in('Comment', with: 'What a lovely photo')
      click_button('Create Comment')
      expect(page).to have_content('added by Test User')
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

    context 'The user did not create the comment' do
      scenario 'Users cannot edit a comment that they did not create' do
        visit '/photos'
        click_link 'Add photo'
        fill_in('Title', with: 'Test Photo')
        attach_file('Image', 'spec/files/images/testimage.jpg')
        click_button 'Create Photo'
        click_link('Add Comment')
        fill_in('Comment', with: 'What a lovely photo')
        click_button('Create Comment')
        click_link('Sign out')
        sign_up(user2)
        visit '/photos'
        click_link('Test Photo')
        expect(page).not_to have_content('Edit ')
      end

      scenario 'Users cannot delete a comment that they did not create' do
        visit '/photos'
        click_link 'Add photo'
        fill_in('Title', with: 'Test Photo')
        attach_file('Image', 'spec/files/images/testimage.jpg')
        click_button 'Create Photo'
        click_link('Add Comment')
        fill_in('Comment', with: 'What a lovely photo')
        click_button('Create Comment')
        click_link('Sign out')
        sign_up(user2)
        visit '/photos'
        click_link('Test Photo')
        expect(page).not_to have_content('Delete')
      end
    end
  end
end
