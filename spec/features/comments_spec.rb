require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  before do
    sign_up
    make_a_post
  end

  scenario 'Comments can be added to a post' do
    make_a_comment
    make_a_comment(comment: 'Wow...')
    expect(current_path).to eq('/posts')
    expect(page.status_code).to eq(200)
    within('.comments-comments') do
      expect(page.all('.comments-comment')[0]).to have_content('Adorable!')
      expect(page.all('.comments-comment')[1]).to have_content('Wow...')
    end
  end
end
