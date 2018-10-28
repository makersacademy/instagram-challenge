# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Messages", type: :feature do
  before(:each) do
    sign_up_helper_correct
    make_message("Test")
  end

  scenario 'user can make a comment on a post' do
    click_on('Make Comment')
    fill_in :comment_text, with: 'This is a comment'
    click_on('Submit')
    expect(find('div#comment-1.comment')).to have_content('This is a comment')
  end
end
