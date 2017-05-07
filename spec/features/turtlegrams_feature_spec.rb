require 'rails_helper'

feature 'turtlegrams' do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'torty@turtle.com')
    fill_in('Password', with: 'turtle')
    fill_in('Password confirmation', with: 'turtle')
    click_button('Sign up')
  end

  context 'no posts have been added' do
    scenario 'should display a prompt to add a turtlegram' do
      visit '/turtlegrams'
      expect(page).to have_content 'No turtlegrams yet'
      expect(page).to have_content 'Add a turtlegram'
    end
  end

  context 'turtlegrams have been added' do
    before do
      vivien = User.create(email: 'viv@viv.com', password: '123456', id: 1)
      Turtlegram.create(caption: 'Shelly', image: File.new(File.join(Rails.root,"public/uploads/turtlegram/image/1/turtle.jpg")), user: vivien)
    end
      scenario 'displays a turtlegram on a feed with caption and turtle email' do
        visit '/turtlegrams'
        expect(page).to have_content('Shelly')
        expect(page).to have_content('viv@viv.com')
        expect(page).not_to have_content('No turtlegrams yet')
      end

      scenario "lets a turtle see another turtle's feed" do
        visit '/turtlegrams'
        click_link('viv@viv.com')
        expect(page).to have_content("viv@viv.com's turtlegrams")
        expect(current_path).to eq "/users/1"
      end
    end

    context 'editing turtlegrams' do
      before do
        vivien = User.create(email: 'viv@viv.com', password: '123456', id: 1)
        Turtlegram.create(caption: 'Shelly', image: File.new(File.join(Rails.root,"public/uploads/turtlegram/image/1/turtle.jpg")), user: vivien, id: 2)
      end
    scenario 'lets a turtle edit their own turtlegram' do
      click_link('Sign out')
      click_link('Sign in')
      fill_in('Email', with: 'viv@viv.com')
      fill_in('Password', with: '123456')
      click_button('Log in')
      click_link('Edit turtlegram')
      expect(page).to have_content 'Shelly'
      expect(current_path).to eq '/turtlegrams/2/edit'
    end
    end
end
