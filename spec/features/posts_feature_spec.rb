require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add Post'
    end
  end

  context 'viewing posts' do

      scenario 'lets a user view a post' do
        post = Post.create(caption: 'Driving along the Amalfi coast', image: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/7569/SITours/private-tour-amalfi-coast-from-sorrento-in-sorrento-288314.jpg")
        visit '/posts'
        find('img').click
        expect(page).to have_content 'Driving along the Amalfi coast'
      end

  end

  context 'posts have been added' do
    scenario 'display posts' do
      Post.create(caption: 'Driving along the Amalfi coast', image: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/7569/SITours/private-tour-amalfi-coast-from-sorrento-in-sorrento-288314.jpg")
      visit '/posts'
      expect(page).to have_content('Driving along the Amalfi coast')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating a post' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/posts'
      click_link 'Add Post'
      fill_in 'Caption', with: 'Beautiful fabrics in India'
      page.attach_file('post[image]', Rails.root + 'spec/Fixtures/mumbaimarket.jpg')
      click_button 'Create Post'
      expect(page).to have_content 'Beautiful fabrics in India'
      expect(current_path).to eq '/posts'
    end
  end

  context 'editing restaurants' do

    scenario 'let a user edit a post' do
      Post.create(caption: 'Driving along the Amalfi coast', image: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/7569/SITours/private-tour-amalfi-coast-from-sorrento-in-sorrento-288314.jpg")
      visit '/posts'
      click_link 'Edit'
      fill_in 'Caption', with: 'Positano by night'
      click_button 'Update'
      expect(page).to have_content 'Positano by night'
      expect(page).not_to have_content 'Driving along the Amalfi coast'
    end

  end

  context 'deleting restaurants' do

    scenario 'removes a post when a user clicks delete' do
      Post.create(caption: 'Driving along the Amalfi coast', image: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/7569/SITours/private-tour-amalfi-coast-from-sorrento-in-sorrento-288314.jpg")
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'Driving along the Amalfi coast'
      expect(page).to have_content 'Restaurant deleted successfully'
    end

  end



end
