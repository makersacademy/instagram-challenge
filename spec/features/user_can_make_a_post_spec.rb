require 'spec_helper'

RSpec.feature "Post", type: :feature do
	let!(:user) { create(:user) }

  before do
    login
  end

	scenario 'can be created' do
		visit '/posts/new'
		within(:css, 'form.new_post') do
			fill_in 'post_caption', with: 'Test image'
    	page.attach_file 'post_image', Rails.root + 'spec/files/images/test_image.jpg'
    	click_button 'Create Post'
		end
    expect(page).to have_content('Test image')
    expect(page).to have_css("img[src*='test_image.jpg']")
	end
end
