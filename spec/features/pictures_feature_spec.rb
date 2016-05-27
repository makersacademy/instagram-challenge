require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Upload a picture'
    end
  end

  context 'pictures have been added' do
	  before do
	    Picture.create(title: 'Me')
	  end

	  scenario 'display pictures' do
	    visit '/pictures'
	    expect(page).to have_content('Me')
	    expect(page).not_to have_content('No pictures yet')
	  end
	end

	context 'uploading pictures' do
	  scenario 'prompts user to fill out a form, then displays the new picture' do
	    visit '/pictures'
	    click_link 'Upload a picture'
	    fill_in 'Title', with: 'Me'
	    click_button 'Upload'
	    expect(page).to have_content 'Me'
	    expect(current_path).to eq '/pictures'
	  end
	end

	context 'viewing restaurants' do

	  let!(:myself){ Picture.create(title: 'Me') }

	  scenario 'lets a user view a picture' do
	   visit '/pictures'
	   click_link 'Me'
	   expect(page).to have_content 'Me'
	   expect(current_path).to eq "/pictures/#{myself.id}"
	  end
	end

	context 'editing picture information' do
		before { Picture.create title: 'Me' }

		scenario 'let a user edit the picture info' do
			visit '/pictures'
			click_link 'My pictures'
			click_link 'Edit picture Me'
			fill_in 'Title', with: 'You'
			click_button 'Update Picture'
			expect(page).to have_content 'You'
			expect(current_path).to eq '/pictures/my_pictures'
		end
	end

	context 'deleting pictures' do
	  before { Picture.create title: 'Me' }

	  scenario 'removes a picture when a user clicks a delete link' do
	    visit '/pictures'
			click_link 'My pictures'
			click_link 'Delete picture Me'
	    expect(page).not_to have_content 'Me'
	    expect(page).to have_content 'Picture deleted successfully'
	    expect(current_path).to eq '/pictures/my_pictures'
	  end

	end

end