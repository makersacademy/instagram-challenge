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
	    sign_up_helper
    	create_picture
	  end

	  scenario 'display pictures' do
	    visit '/pictures'
	    expect(page).to have_content('Me')
	    expect(page).not_to have_content('No pictures yet')
	  end
	end

	context 'Creating pictures' do
	  before { sign_up_helper }

	  scenario 'prompts user to fill out a form, then displays the new picture' do
	    create_picture
	    expect(page).to have_content 'Me'
	    expect(current_path).to eq '/pictures'
	  end

	  context 'an invalid picture' do
	    it 'does not let you submit a picture without title' do
	      create_picture_invalid
	      expect(page).to have_content 'Title can\'t be blank'
	    end
	  end
	end

	context 'viewing restaurants' do

	  before do
	    sign_up_helper
    	create_picture
	  end

	  scenario 'lets a user view a picture' do
	   visit '/pictures'
	   first('.panel-body > a').click
	   expect(page).to have_content 'Me'
	  end
	end

	context 'editing picture information' do
		before do
			sign_up_helper
			create_picture
		end

		scenario 'let a user edit the picture info' do
			click_link 'My pictures'
			click_link 'Edit'
			fill_in 'Title', with: 'You'
			click_button 'Upload'
			expect(page).to have_content 'You'
			expect(current_path).to eq '/pictures/my_pictures'
		end
	end

	context 'deleting pictures' do
		before do
			sign_up_helper
			create_picture
		end

	  scenario 'removes a picture when a user clicks a delete link' do
			click_link 'My pictures'
			click_link 'Delete'
	    expect(page).not_to have_content 'Me'
	    expect(page).to have_content 'Picture deleted successfully'
	    expect(current_path).to eq '/pictures/my_pictures'
	  end
	end
end