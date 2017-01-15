require 'rails_helper'
require 'web_helpers'

feature 'commenting' do


  context 'user is logged in' do

    before do
      sign_up("test@gmail.com", "password")
      create_post("description")
      visit '/'
      leave_comment("amazing")
    end

    context 'leaving a comment'do

      scenario 'allows users to leave a comment using a form' do
        expect(current_path).to eq '/photographs'
        expect(page).to have_content('amazing')
      end

    end

    context 'deleting a comment' do
      scenario 'user can delete their own comment' do
        expect(page).to have_link('Delete comment')
      end

      scenario 'user cannot delete another user\'s comment' do
        visit '/'
        click_link 'Sign out'
        sign_up("test2@gmail.com","password")
        expect(page).not_to have_link('Delete comment')

      end
    end





  end

  context 'user is not logged in' do

    scenario 'cannot leave a comment' do
      visit '/'
      expect(page).not_to have_link 'Leave Comment'
    end

  end



end
