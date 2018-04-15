require 'rails_helper'

def create_post
  visit('/posts/')
  click_link 'NEW MOMENT'
  fill_in 'post[caption]', with: 'Test Caption :)'
  click_button 'SHARE MOMENT'
end
