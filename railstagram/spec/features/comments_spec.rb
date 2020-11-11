require 'rails_helper'

RSpec.feature('Posts') do
	scenario('User can add a comment to a post') do
		sign_up
        visit('/posts/new')
        expect(page).to have_content "Make a post"
        make_post
        visit('posts/1')
        expect(page).to have_content "Comments"
        fill_in :comment_body, with: "This is a comment"
        click_button "Submit"
        expect(page).to have_content "dill: This is a comment"
    end
end

RSpec.feature('Posts') do
    scenario('User sees link to all comments when there are more than 2 comments') do
        sign_up
        visit('/posts/new')
        make_post
        visit('posts/2')
        make_4_comments
        expect(page).not_to have_content "This is yet another comment which cant be seen"
        expect(page).to have_content "View all comments"
    end  
end
