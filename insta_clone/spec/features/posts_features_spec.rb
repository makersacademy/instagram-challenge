require 'rails_helper'

  feature 'posts' do

    context 'no posts should have been added' do
      scenario 'should display a prompt to add a post' do
        visit '/posts'
        expect(page).to have_content 'No posts yet'
        expect(page).to have_link 'Add a post'
      end
    end

    context 'posts have been added' do
        before do
            Post.create(name: 'Nice Picture')
        end

        scenario 'display posts' do
            visit '/posts'
            expect(page).to have_content('Nice Picture')
            expect(page).not_to have_content('No posts yet')
        end
    end

    context 'creating posts' do
        scenario 'prompts user to fill out a form, then displays the new post' do
            visit '/posts'
            click_link 'Add a post'
            fill_in 'Name', with: 'Nice Picture'
            click_button 'Create Post'
            expect(page).to have_content 'Nice Picture'
            expect(current_path).to eq '/posts'
        end
    end

    context 'viewing posts' do

      let!(:post){ Post.create(name:'Nice Picture') }

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Nice Picture'
      expect(page).to have_content 'Nice Picture'
      expect(current_path).to eq "/posts/#{post.id}"
    end

end

  end
