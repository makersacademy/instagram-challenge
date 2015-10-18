require 'rails_helper'

feature 'User comments' do

  context 'when commenting' do
    
    scenario 'users can comment on posts' do
      user = build(:user)
      sign_up(user)
      create_post
      comment_on_post("awesome pic!")
      expect(page).to have_content "awesome pic!"
    end

  end
  
end
