require 'rails_helper'

module CommentsHelper
  def create_comment(text)
    click_link 'Comment'
    fill_in 'Text', with: text
    click_button 'Leave Comment'
  end

  def edit_comment(text)
    click_link 'Edit comment'
    fill_in 'Text', with: text
    click_button 'Edit Comment'
  end
end
