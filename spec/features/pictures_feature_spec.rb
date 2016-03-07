require 'rails_helper'

feature 'Pictures' do
  # As a user
  # So that I can use Instagram
  # I would like to post pictures on it

  context 'no pictures have been posted' do
    scenario 'should show a button to post a picture' do
      visit '/pictures'
      expect(page).to have_link('Post a picture')
    end
  end

  context 'posting pictures' do
    context 'when signed in' do
      before(:each) do
        user = FactoryGirl.create(:user, :first)
        sign_in(user.email, user.password)
      end

      scenario 'user can upload a picture' do
        visit '/pictures/'
        click_link 'Post a picture'
        fill_in 'Description', with: 'My first picture!'
        page.attach_file('Image', Rails.root + 'spec/factories/test.jpg')
        expect(attach_file('Image', 'spec/factories/test.jpg')).to be_truthy
      end

      scenario 'throws error if user does not upload an image' do
        click_link 'Post a picture'
        fill_in 'Description', with: 'My first picture!'
        click_button 'Post'
        expect(page).to have_content('Error: You must upload a picture')
      end
    end

    context 'when signed out' do
      scenario 'user cannot post pictures' do
        visit '/'
        click_link 'Post a picture'
        expect(page).to have_content 'Log in'
      end
    end
  end

  # As a user
  # So that I can see pictures posted by other users
  # I would like to see all users' pictures on the homepage
  context 'viewing pictures' do
    before(:each) do
      user = FactoryGirl.create(:user, :first)
      sign_in(user.email, user.password)
    end

    scenario 'pictures can be viewed' do
      visit '/pictures/new'
      fill_in 'Description', with: 'My first picture!'
      page.attach_file('Image', Rails.root + 'spec/factories/test.jpg')
      click_button 'Post'
      visit '/'
      expect(page).to have_xpath("//img[contains(@src, \"medium/test.jpg\")]")
    end

    scenario 'picture description can be viewed' do
      picture = FactoryGirl.create(:picture, user: FactoryGirl.create(:user, :second))
      visit '/'
      expect(page).to have_content(picture.description)
    end

    # As a user
    # So that I can show that I posted a picture
    # I would like my username to be displayed with a picture I posted
    scenario 'username is displayed' do
      picture = FactoryGirl.create(:picture, user: FactoryGirl.create(:user, :second))
      visit '/pictures'
      expect(page).to have_link picture.user.username
    end
  end

  # As a user
  # So that I can remove one of my posted pictures
  # I would like to delete a picture
  context 'deleting pictures' do
    context 'when signed in' do
      before(:each) do
        user = FactoryGirl.create(:user, :first)
        sign_in(user.email, user.password)
      end

      scenario 'users can delete their own pictures' do
        post_picture
        visit '/pictures'
        click_link 'Delete'
        expect(page).not_to have_xpath("//img[contains(@src, \"medium/test.jpg\")]")
      end

      scenario 'user cannot delete others users\' pictures' do
        post_picture
        click_button 'Sign out'
        user = FactoryGirl.create(:user, :second)
        sign_in(user.email, user.password)
        visit '/pictures'
        click_link 'Delete'
        expect(page).to have_content 'You cannot delete this picture as you did not create it'
      end
    end

    context 'when signed out' do
      scenario 'signed out users cannot delete pictures' do
        picture = FactoryGirl.create(:picture, user: FactoryGirl.create(:user, :second))
        visit '/pictures'
        expect(page).not_to have_link 'Delete'
      end
    end
  end

  context 'editing pictures' do
    before(:each) do
      user = FactoryGirl.create(:user, :first)
      sign_in(user.email, user.password)
    end

    context 'when signed in' do
      scenario 'user can edit their own pictues' do
        post_picture
        visit '/pictures'
        click_link 'Edit'
        fill_in 'Description', with: 'My first edited picture!'
        click_button 'Update'
        expect(page).to have_content 'My first edited picture!'
      end

      scenario 'user cannot edit other users\' pictures' do
        post_picture
        click_button 'Sign out'
        user = FactoryGirl.create(:user, :second)
        sign_in(user.email, user.password)
        visit '/pictures'
        click_link 'Edit'
        expect(page).to have_content 'You cannot edit this picture as you did not create it'
      end
    end

    context 'when signed out' do
      scenario 'signed out users cannot edit pictures' do
        picture = FactoryGirl.create(:picture, user: FactoryGirl.create(:user, :second))
        click_button 'Sign out'
        visit '/pictures'
        expect(page).not_to have_link 'Edit'
      end
    end
  end
end
