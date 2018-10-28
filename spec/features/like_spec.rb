# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  before(:each) do
    sign_up_helper_correct
    make_message("Test")
  end

  scenario 'user can like a post' do
    click_on('Like')
    expect(find('p#likes-1')).to have_content('1')
  end
end
