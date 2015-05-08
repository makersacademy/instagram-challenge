require 'rails_helper'

module CommentsHelper
  def create_comment(text)
    visit '/posts'
    click_link 'Comment'
    fill_in 'Text', with: text
    click_button 'Leave Comment'
  end
end
