require 'Rails_helper'

feature 'user can add a photo' do
	context 'when no photo have been added' do
	it'displays no photo' do 
		visit('/')
		expect(page).to have_content('No photos added yet')
		expect(page).to have_link('Add a photo')
	end
end

context 'when photo has been added' do
it'displays the photo' do 
	visit('/')
	click_link('Add a photo')
	expect(current_path).to eq('/photos/new')
	allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(:true)
	attach_file('photo[image]', "#{Rails.root}/spec/cat.jpg", visible: false)
	click_button('Create Photo')
	expect(page).to have_css("img[src*='cat.jpg']")
end
end

it'displays a brief description' do 
	visit('/')
	click_link('Add a photo')
	expect(current_path).to eq('/photos/new')
	allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(:true)
	attach_file('photo[image]', "#{Rails.root}/spec/cat.jpg", visible: false)
	fill_in('Description', with: "Check out my cat" )
	click_button('Create Photo')
	expect(page).to have_content("Check out my cat")
end
end