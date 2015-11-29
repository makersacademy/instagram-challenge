require 'rails_helper'
require_relative 'helpers'

feature 'pictures' do
	context 'no pictures have been added' do
		scenario 'should display a prompt to add a picture' do
			visit '/pictures'
			expect(page).to have_content 'No pictures yet'
			expect(page).to have_link 'Add a Picture'
		end
	end

	context 'restaurants have been added' do
	  before do
	    Picture.create(name: 'selfie', description: 'cool')
	  end

	  scenario 'display pictures' do
	    visit '/pictures'
	    expect(page).to have_content('selfie')
	    expect(page).not_to have_content('No pictures yet')
	  end
	end

	context 'creating pictures' do
	  scenario 'prompts user to fill out a form, then displays the new picture' do
	    sign_up
	    visit '/pictures'
	    click_link 'Add a Picture'
	    fill_in 'Name', with: 'selfie2'
	    fill_in 'Description', with: 'holidays'
	    click_button 'Add Picture'
	    expect(page).to have_content 'selfie2'
	    expect(current_path).to eq '/pictures'
	  end
	end

	context 'viewing pictures' do
	  let!(:summer){Picture.create(name:'summer')}

	  scenario 'lets a user view a picture' do
	    visit '/pictures'
	    click_link 'summer'
	    expect(page).to have_content 'summer'
	  	expect(current_path).to eq "/pictures/#{summer.id}"
	  end
	end

	context 'editing pictures' do

	  before { Picture.create name: 'holidays' }

	  scenario 'let a user edit a picture' do
	    sign_up
	    visit '/pictures'
	    click_link 'Edit holidays'
	    fill_in 'Name', with: 'holidays 2015'
	    click_button 'Add Picture'
	    expect(page).to have_content 'holidays 2015'
	    expect(current_path).to eq '/pictures'
	  end
	end

	context 'deleting pictures' do

	  before {Picture.create name: 'picture1'}

	  scenario 'removes a picture when a user clicks a delete link' do
	    sign_up
	    visit '/pictures'
	    click_link 'Delete picture1'
	    expect(page).not_to have_content 'picture1'
	    expect(page).to have_content 'Picture deleted successfully'
	  end
	end

	context "a user must be logged in to add a picture" do
    it "should sign in for adding a picture" do
      visit '/pictures'
      click_link 'Add a Picture'
      expect(page).to have_content "Log in"
    end
  end
end