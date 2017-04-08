require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add Post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(caption: 'Driving along the Amalfi coast', image: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/7569/SITours/private-tour-amalfi-coast-from-sorrento-in-sorrento-288314.jpg")
    end

    scenario 'display posts' do
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

  context 'viewing restaurants' do

    let!(:post){ Post.create(caption: 'Driving along the Amalfi coast', image: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/7569/SITours/private-tour-amalfi-coast-from-sorrento-in-sorrento-288314.jpg") }

      scenario 'lets a user view a post' do
        visit '/posts'
        find('img').click
        expect(page).to have_content 'Driving along the Amalfi coast'
        expect(current_path).to eq "/posts/#{post.id}"
      end

  end


end
