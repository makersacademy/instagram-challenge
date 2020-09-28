require 'rails_helper'
require_relative '../helpers/sign_up.rb'
require_relative '../helpers/make_post.rb'


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
