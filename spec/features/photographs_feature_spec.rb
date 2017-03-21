require 'rails_helper'
require 'web_helpers'

feature 'photographs' do

  context 'a user is signed in' do

    before do
      sign_up("test@gmail.com","password")
    end

    context 'no photographs have been added' do
      scenario 'should display a prompt to add a photograph' do
        visit '/photographs'
        expect(page).to have_content 'No posts yet'
        expect(page).to have_link 'Add a post'
      end
    end

    context 'photographs have been added' do
      before do
        create_post('description')
      end

      scenario 'displays photographs' do
        visit '/photographs'
        expect(page).to have_content('description')
        expect(page).to have_css("img[src*='missing.png']")
        expect(page).not_to have_content('No posts yet')
      end
    end

    context 'creating a photograph' do
      scenario 'prompts the user to fill out a form, then displays the new restaurant' do
        visit '/photographs'
        create_post("description")
        expect(page).to have_content('description')
        expect(current_path).to eq '/photographs'
      end
    end

    context 'deleting a post' do

      before do
        visit '/'
        create_post("description")
      end

      scenario 'only if it belongs to the user' do
        click_link 'Sign out'
        sign_up("test1@gmail.com", "password")
        expect(page).not_to have_link("Delete post")
      end

      scenario 'only if logged in' do
        click_link 'Sign out'
        visit '/'
        expect(page).not_to have_link("Delete post")
      end

      scenario 'removes a post when a user clicks a delete link' do
        click_link 'Delete post'
        expect(page).not_to have_content 'description'
        expect(page).to have_content 'Post deleted succesfully'
      end


    end

  end

  context 'a user is not signed in' do

    scenario 'trying to add a photo takes them to the sign up page' do
        visit '/'
        click_link 'Add a post'
        expect(current_path).to eq '/users/sign_in'
      end

  end

end
