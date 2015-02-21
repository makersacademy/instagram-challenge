require 'rails_helper'

def sign_up(email)
	visit '/posts'
	click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

feature 'posts' do
	
	context 'no posts have been added' do

		scenario 'should display a prompt to add a post' do
			visit '/posts'
			expect(page).to have_content 'No posts'
			expect(page).to have_link 'Add a post'
		end
	end

	context 'posts have been added' do

		before do
			Post.create(name: 'Pic')
		end

		scenario 'display posts' do
			visit '/posts'
			expect(page).to have_content('Pic')
			expect(page).not_to have_content('No posts')
		end
		
	end

	context 'creating posts' do

		scenario 'prompts user to fill a form, then displays post' do
			sign_up("a@a.com")
			click_link 'Add a post'
			fill_in 'Name', with: 'Pic'
			click_button 'Create Post'
			expect(page).to have_content 'Pic'
			expect(current_path).to eq '/posts'
		end

	end

	context 'viewing posts' do
		let!(:pic){Post.create(name: 'Pic')}

		scenario 'lets a user view a post' do
			visit '/posts'
			click_link 'Pic'
			expect(page).to have_content 'Pic'
			expect(current_path).to eq "/posts/#{pic.id}"
		end

	end

	context 'editing posts' do
		before {Post.create name: 'Pic'}

		scenario 'let a user edit a post' do
			sign_up("a@a.com")
			click_link 'Edit post'
			fill_in 'Name', with: 'Picture'
			click_button 'Update Post'
			expect(page).to have_content "Picture"
			expect(current_path).to eq "/posts"
		end
	end

	context 'deleting posts' do
		before {Post.create name: 'Pic'}

		scenario 'let a user delete a post' do
			sign_up("a@a.com")
			click_link 'Delete Pic'
			expect(page).not_to have_content "Pic"
			expect(page).to have_content "Post deleted successfully"
		end
	end

end