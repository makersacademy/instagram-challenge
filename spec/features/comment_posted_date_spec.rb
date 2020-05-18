require 'rails_helper'

RSpec.feature 'Comment Date', type: :feature do

  scenario "displays the date when the comment was posted" do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
    comment
    
    within('.comment') do
      expect(page).to have_content "#{time_ago_in_words(Comment.first.created_at)} ago"
    end

  end

end
