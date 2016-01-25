require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should show a message that no pictures have been saved yet' do
      visit '/'
      expect(page).to have_content 'No pictures yet'
    end
  end
  context 'pictures have been added' do
    before { create(:picture, user: create(:user, username: 'user')) }
    scenario 'display pictures' do
      visit '/'
      expect(page).to have_xpath("//figure[contains(@style, 'test.png')]")
      expect(page).not_to have_content 'No pictures yet'
    end
    scenario 'display username who posted the picture' do
      visit '/'
      expect(page).to have_content 'user'
    end
  end
  context 'user is signed in' do
    before { sign_in_as(create(:user)) }
    scenario 'should display a prompt to post a picture' do
      visit '/'
      expect(page).to have_link 'Post a picture'
    end
  end
  context 'user is not signed in' do
    scenario 'should not display any prompt to post a picture' do
      visit '/'
      expect(page).not_to have_link 'Post a picture'
    end
  end

  context 'posting pictures' do
    context 'user is signed in' do
      before { sign_in_as(create(:user)) }
      scenario 'prompts user to fill out a form, then displays the picture' do
        visit '/'
        click_link 'Post a picture'
        page.attach_file('picture[image]',
          Rails.root + 'spec/fixtures/images/test.png')
        click_button 'Post picture'
        expect(page).to have_xpath("//figure[contains(@style, 'test.png')]")
      end
      scenario 'does not let post a picture if not attached' do
        visit '/'
        click_link 'Post a picture'
        fill_in 'picture[description]', with: 'description'
        click_button 'Post picture'
        expect(page).not_to have_xpath("//figure[contains(@style, 'test.png')]")
        expect(page).to have_content 'Image can\'t be blank'
      end
    end
    context 'user is not signed in' do
      scenario 'redirect to the sign in page' do
        visit '/pictures/new'
        expect(current_path).to eq "/users/sign_in"
      end
    end
  end

  context 'showing single picture' do
    let!(:pic) { create(:picture, user: create(:user, username: 'user')) }
    before do
      visit '/pictures'
      find('.image').click
    end
    scenario 'show the picture' do
      expect(page).to have_xpath("//figure[contains(@style, 'test.png')]")
      expect(current_path).to eq "/pictures/#{pic.id}"
    end
    scenario 'show picture user' do
      expect(page).to have_content pic.username
    end
    scenario 'show picture description' do
      expect(page).to have_content pic.description
    end
  end
end
