require 'rails_helper'

feature 'posts' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/posts'
      expect(page).to have_content 'No Pictures Yet!'
      expect(page).to have_link 'Add a Post'
    end
  end

  xcontext 'creating posts' do
    xscenario 'should allow user to add a post' do
      visit '/'
      click_link 'Add a Post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(caption: '#chilling')
    end

    context 'on main page' do
      scenario 'display posts' do
        visit '/posts'
        expect(page).to have_content('#chilling')
        expect(page).not_to have_content('No Pictures Yet!')
      end
    end

    xcontext "when a post picture is clicked" do
      xscenario 'allows user to view post on separate page' do
        visit '/posts'
      end
    end
  end
end
