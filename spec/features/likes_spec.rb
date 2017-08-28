require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  before do
    sign_up
    make_a_post
  end

  scenario 'User can like a post' do
    click_link '♥'
    expect(current_path).to eq('/posts')
    expect(page.status_code).to eq(200)
    expect(page.all('.likes-count')[0]).to have_content('1 like')
  end
end
