require 'rails_helper'
require 'web_helper'

describe 'likeing comtirbutions' do
  before do
    contribution = Contribution.create(comment: 'A black cat')
  end

  scenario 'a user can like a contribution, which updates the like count' do
    visit '/contributions'
    click_link '+'
    expect(page).to have_content('1 like')
  end
end
