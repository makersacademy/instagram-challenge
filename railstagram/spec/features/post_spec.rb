require 'rails_helper'

RSpec.feature('Posts') do
	scenario('User can make a post with an image') do
		sign_up
        visit('/posts/new')
        expect(page).to have_content "Make a post"
        make_post
        expect(page).to have_content "dill"
        expect(page).to have_content "A caption for a post"
	end
end
