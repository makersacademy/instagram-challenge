require 'rails_helper'

feature 'User comments' do

  context 'when making a comment' do
    
    scenario 'the comments display in the feed' do
      user = build(:user)
      sign_up(user)
      create_post
      comment_on_post("awesome pic!")
      expect(page).to have_content "awesome pic!"
    end

    scenario 'the feed display who commented' do
      user = build(:user)
      sign_up(user)
      create_post
      comment_on_post("awesome post!")
      expect(page).to have_content "testtest@gmail.com"
    end

    scenario 'a timestamp is included' do
      user = build(:user)
      sign_up(user)
      create_post
      comment_on_post("awesome post!")
      time = Time.now - 3600
      expect(page).to have_content("#{time.strftime('%a, %d %b %Y %H:%M:%S')}")
    end

  end
  
end
