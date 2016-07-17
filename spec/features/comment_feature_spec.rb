require 'rails_helper'

feature 'reviewing' do


  scenario 'allows users to leave a review using a form' do
     sign_up
     add_post
     find(:xpath, "(//a[contains(@href,'posts/1')])[1]").click
     fill_in "Comment", with: "hahahaha"
     click_button 'Comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('hahahaha')
  end

end
