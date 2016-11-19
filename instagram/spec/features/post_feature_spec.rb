require 'rails_helper'

feature 'posts' do
    context 'no posts have been added' do
        scenario 'should display a prompt to add a post' do
            visit '/posts'
            expect(page).to have_content 'No posts yet'
            expect(page).to have_link 'Add a post'
        end
    end

    context 'posts have been added' do
        before do
            Post.create(caption: 'Woof')
        end

        scenario 'display posts' do
            visit '/posts'
            expect(page).to have_content('Woof')
            expect(page).not_to have_content('No posts yet')
        end
    end

    context 'creating posts' do
        scenario 'tells user to fill in a form, then displays the new post' do
            visit '/posts'
            click_link 'Add a post'
            fill_in 'Caption', with: 'Amazing'
            click_button 'Create Post'
            expect(page).to have_content 'Amazing'
            expect(current_path).to eq '/posts'
        end
    end

    context 'viewing posts' do

  let!(:sunset){ Post.create(caption:'sunset') }

  scenario 'lets a user view a post' do
   visit '/posts'
   click_link 'sunset'
   expect(page).to have_content 'sunset'
   expect(current_path).to eq "/posts/#{sunset.id}"
  end

end
end
