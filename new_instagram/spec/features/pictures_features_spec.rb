require 'rails_helper'

feature 'pictures' do
  context 'no pictures added' do
    scenario 'should display a promp to add a picture' do
      visit '/pictures'
      create_user
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add new picture'
    end
  end
  context "Some pictures added" do
    before do
      create_user
      Picture.create(title: "me")
    end
    scenario "display pictures" do
      visit '/pictures'
      expect(page).to have_content 'me'
      expect(page).not_to have_content 'No pictures yet'
    end
  end

  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/pictures'
      create_user
      create_picture
      expect(page).to have_content 'me'
      expect(page).to have_selector('.image')

      expect(current_path).to eq '/pictures'
    end
  end

  context 'showing restaurants' do

    let!(:me){Picture.create(title: 'ME')}
    scenario 'lets a user to view a picture' do
      visit '/pictures'
      click_link 'ME'
      expect(current_path).to eq "/pictures/#{me.id}"
    end
  end
end

  context 'deleting restaurants' do
    xcontext 'no user signed_in' do
      before {Picture.create(title: "me")}

      scenario 'cant delete' do
        visit '/pictures'
        click_link 'Delete me'
        expect(page).to have_content "picture can't be deleted"
      end
    end
  end

def create_picture
  click_link 'Add new picture'
  
  fill_in 'picture[title]', with: 'me'
  attach_file('picture[picture]', './app/assets/images')
  click_button 'post'
end


def create_user
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
