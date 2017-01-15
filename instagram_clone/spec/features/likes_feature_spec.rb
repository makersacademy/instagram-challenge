require 'rails_helper'
require 'web_helper'

describe 'likeing comtirbutions' do
  before do
    @image  = fixture_path + "/test_image.jpg"
    sign_up
    visit '/contributions'
    click_link 'Add a contribution'
    attach_file 'Image', @image
    fill_in 'Comment', with: 'A black cat'
    click_button 'Create Contribution'
  end

  it 'a user can like a contribution, which updates the like count', js: true do
    visit '/contributions'
    click_link '♡'
    expect(page).to have_content('1 like')
  end
end
