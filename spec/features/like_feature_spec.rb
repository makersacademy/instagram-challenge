require 'rails_helper'
require 'web_helper'

scenario 'like an imnage' do
  like_image
  expect(page).to have_content('Like - 1')
end
