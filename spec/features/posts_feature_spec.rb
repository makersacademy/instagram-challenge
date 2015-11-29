require 'rails_helper'

feature 'Posting' do	
	context 'no posts have been added' do
		scenario 'should display a prompt to add a post' do
			visit '/'
			expect(page).to have_content 'No Posts yet!'
			expect(page).to have_link 'Add Post'
		end
	end

	context 'posts have been added' do
		before do
			Post.create(name: 'Sunset')
		end

		scenario 'display posts' do
			visit '/posts'
			expect(page).to have_content('Sunset')
			expect(page).not_to have_content('No Posts yet!')
		end
	end

	context 'creating posts' do
	  scenario 'when signed in' do
	  	sign_up("test@test.com", "password")
	    add_post
	    expect(page).to have_content 'Sunset'
	    expect(current_path).to eq '/posts'
	  end

	  scenario 'when not signed in' do
	    visit ('/posts')
			click_link 'Add Post'
	    expect(page).to have_content 'Log in'
	  end
	end

	context 'viewing posts' do
		scenario 'lets a user view a post' do
			sign_up("test@test.com", "password")
			add_post
			click_link 'Sunset'
			expect(page).to have_content('Sunset')
			expect(current_path).not_to eq('/posts')
		end
	end

	context 'editing posts' do
		scenario 'as the creator' do
			sign_up("test@test.com", "password")
			add_post
			click_link 'Edit Post'
			fill_in 'Name', with: 'Best Sunset'
			click_button 'Update Post'
			expect(page).to have_content 'Best Sunset'
			expect(current_path).to eq '/posts'
		end

		scenario 'not as the creator' do
	  	sign_up('test@example.com', 'testtest')
	  	add_post
	  	click_link 'Sign Out'
	  	sign_up('another@another.com', 'anotheranother')
	  	visit '/posts'
	  	click_link 'Edit'
	  	expect(page).to have_content('Sunset')
	  	expect(page).to have_content "You didn't post this"
	  end
	end

	context 'deleting posts' do
		scenario 'as the creator' do
			sign_up("test@test.com", "password")
			add_post
			click_link 'Delete Post'
			expect(page).not_to have_content 'Sunset'
			expect(page).to have_content 'Post deleted successfully'
		end

		scenario 'not as the creator' do
			sign_up('test@example.com', 'testtest')
			add_post
			click_link 'Sign Out'
			sign_up('another@another.com', 'anotheranother')
			visit '/posts'
			click_link 'Delete'
			expect(page).to have_content('Sunset')
			expect(page).to have_content("You didn't post this")
		end
	end
end

