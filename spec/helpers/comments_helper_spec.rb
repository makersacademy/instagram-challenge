require 'rails_helper'

module CommentsHelper
  def create_comment(text)
    click_link 'Comment'
    fill_in 'Text', with: text
    click_button 'Leave Comment'
  end

  def edit_comment(text)
    find('.edit_comment').click
    fill_in 'Text', with: text
    click_button 'Edit Comment'
  end
end
