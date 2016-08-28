require 'rails_helper'



  feature 'posts' do
    context 'there have been no posts' do
      scenario 'should display a prompt to submit a post' do
        visit '/posts'
        expect(page).to have_content 'No posts yet'
        expect(page).to have_link 'Add a post'
      end
    end

    context 'there have been posts' do
      before do
        Post.create(caption: 'photo')
      end

      scenario 'display posts' do
        visit '/posts'
        expect(page).to have_content('photo')
        expect(page).not_to have_content('No posts yet')
      end
    end

    context 'creating posts' do
      scenario 'prompts user to create a post, then displays post' do
        visit '/posts'
        click_link 'Add a post'
        fill_in 'Caption', with: 'My post'
        click_button 'Post'
        expect(page).to have_content 'My post'
        expect(current_path).to eq '/posts'
      end

      context 'an invalid post' do
        it 'does not let you submit a post with no caption' do
          visit '/posts'
          click_link 'Add a post'
          click_button 'Post'
          expect(page).to have_content 'error'
        end
      end
    end

    context 'viewing posts' do
      let!(:posty){Post.create(caption:'Sunset')}

        scenario 'lets a user view a post' do
          visit '/posts'
          click_link 'Sunset'
          expect(page).to have_content 'Sunset'
          expect(current_path).to eq "/posts/#{posty.id}"
        end
    end

    context 'editing posts' do

      before {Post.create caption: '#Brunch'}

      scenario 'let a user edit a post' do
        visit '/posts'
        click_link 'Edit'
        fill_in 'Caption', with: '#AvoBrunch'
        click_button 'Update Post'
        expect(page).to have_content '#AvoBrunch'
        expect(current_path).to eq '/posts'
      end
    end

    context 'deleting posts' do

      before {Post.create caption: '#Cats'}

      scenario 'removes a post when a user clicks a delete link' do
        visit '/posts'
        click_link 'Delete'
        expect(page).not_to have_content '#Cats'
        expect(page).to have_content 'Post deleted successfully'
      end
    end

  end
