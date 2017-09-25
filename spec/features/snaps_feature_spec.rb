require 'rails_helper'
require 'helper_methods'
require 'support/features/clearance_helpers'

# include Rack::Test::Methods

RSpec.feature 'Snaps', type: :feature do
  before(:each) do
    sign_in
    @current_user = User.last
    add_snap(@current_user)
    @time1 = format_time_and_date(Time.now.utc)
  end

  context '/snaps' do

    before(:each) do
      visit '/snaps'
    end

    scenario 'Can submit snap and view them' do
      expect(page).to have_content('MyText')
    end

    scenario 'Snaps to have timestamp' do
      expect(page).to have_content(@time1.to_s)
    end

    scenario 'Snaps have users' do
      expect(page).to have_content(@current_user.email)
    end

    it "Snaps have 'like' and 'Unlike' buttons depending on state" do
      expect(page).to have_selector(:button, 'Like')
      expect(page).to_not have_selector(:button, 'Unlike')

      click_link('Like')
      expect(page).to have_selector(:button, 'Unlike')
      expect(page).to_not have_selector(:button, 'Like')
    end

    it "Snaps can be 'liked'" do
      click_link('Like')
      expect(page).to have_content("1 like this")
    end

    it "Snaps can be 'unliked'" do
      click_link('Like')
      expect(page).to have_content("1 like this")
      click_link('Unlike')
      expect(page).to have_content("0 like this")
    end

    it "Snaps cannot be 'liked' more than once" do
      click_link('Like')
      expect(page).to_not have_link('Like')
      expect(page).to have_content("1 like this")
    end

    it 'cannot like/unlike when logged out' do
      sign_out
      expect(page).to_not have_selector(:button, 'Like')
    end

    it 'can delete when signed in' do
      expect(page).to have_selector(:link_or_button, 'Delete Snap')
    end

    it 'are deleted after clicking button' do
      expect(page).to have_content("MyText")
      click_link 'Delete Snap'
      expect(page).to_not have_content("MyText")
    end

    it 'cannot delete when logged out' do
      sign_out
      expect(page).to_not have_selector(:link_or_button, 'Delete Snap')
    end
  end

  context '/show' do

    before(:each) do
      visit '/snaps'
      click_link "Show more"
    end

    it 'shows how many comments for the snap' do
      expect(page).to have_content('This snap has 0 comments')
    end

  end

  # it 'Can like a snap' do
  #   click_button('Like')
  #   expect(page).to have_content('1 like this')
  # end
end
