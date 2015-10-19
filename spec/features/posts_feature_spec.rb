require 'rails_helper'

feature 'Posts' do
  let!(:user){User.create(email: 'dan@example.com',
                          password: 'Hell0World!')}

  before do
    login(user)
  end

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/posts'
      expect(page).to have_content('No Pictures Yet!')
      expect(page).to have_link('Add a Post')
    end
  end

  context 'creating posts' do
    scenario 'should allow user to add a post' do
      visit '/'
      click_link 'Add a Post'
      fill_in 'Caption', with: '#chilling'
      click_button 'Create Post'
      expect(page).to have_content('#chilling')
    end

    scenario 'should not let user add a post if not signed in' do
      visit '/'
      click_link 'Sign Out'
      click_link 'Add a Post'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
      expect(current_path).to eq('/users/sign_in')
    end
  end

  context 'posts have been added' do
    let!(:post){Post.create(image: File.new(Rails.root + 'spec/fixtures/images/example.png'), caption: '#chilling')}

    context 'on main page' do
      scenario 'display posts' do
        visit '/posts'
        expect(page).to have_content('#chilling')
        expect(page).not_to have_content('No Pictures Yet!')
      end
    end

    context "when a post's picture is clicked" do
      before do
        visit '/posts'
        click_link "#{post.id}"
      end

      scenario 'should not let user click picture if not logged in' do
        visit '/'
        click_link 'Sign Out'
        click_link "#{post.id}"
        expect(page).to have_content('You need to sign in or sign up before continuing.')
        expect(current_path).to eq('/users/sign_in')
      end

      context 'and user is logged in' do
        scenario 'allows user to view post on separate page' do
          expect(page).to have_content('#chilling')
          expect(current_path).to eq "/posts/#{post.id}"
        end

        scenario 'allows a user to leave a comment' do
          expect(page).to have_link('Comment')
        end
      end
    end

    context 'deleting posts' do
      scenario 'removes a restaurant when a user clicks a delete link' do
        add_post
        visit '/'
        click_link 'Delete Post'
        expect(page).not_to have_content('#testing')
        expect(page).to have_content('Post deleted successfully')
      end
    end
  end
end
