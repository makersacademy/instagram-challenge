require 'rails_helper'

feature 'Pictures' do
  let(:user) { create :user, :first }
  # As a user
  # So that I can use Instagram
  # I would like to post pictures on it

  context 'no pictures have been posted' do
    scenario 'should show a button to post a picture' do
      sign_in(user.email, user.password)
      visit '/pictures'
      expect(page).to have_link('Post a picture')
    end
  end

  context 'posting pictures' do
    let(:picture_description) { create :picture, :picture_description }
    let!(:description) { create :picture, :description_only }
    scenario 'allows user to upload a picture' do
      sign_in(user.email, user.password)
      visit '/pictures/'
      click_link 'Post a picture'
      fill_in 'Description', with: 'My first picture!'
      page.attach_file('Image', Rails.root + 'spec/factories/test.jpg')
      expect(attach_file('Image', 'spec/factories/test.jpg')).to be_truthy
    end

    scenario 'pictures can be viewed' do
      sign_in(user.email, user.password)
      visit '/pictures/new'
      fill_in 'Description', with: 'My first picture!'
      page.attach_file('Image', Rails.root + 'spec/factories/test.jpg')
      click_button 'Post'
      expect(page).to have_xpath("//img[contains(@src, \"medium/test.jpg\")]")
    end

    scenario 'picture description can be viewed' do
      visit '/pictures'
      expect(page).to have_content(description.description)
    end

    # As a user
    # So that I can show that I posted a picture
    # I would like my username to be displayed with a picture I posted
    scenario 'username is displayed' do
      visit '/pictures'
      expect(page).to have_link 'user.username'
    end
  end
end
