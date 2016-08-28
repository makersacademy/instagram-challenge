require 'rails_helper'

feature 'comment' do
  before { Mewment.create caption: 'Just a little Pro-cat-stination'}

  scenario 'write a comment on a mewment' do
    add_comment('you should be more pro-dog-tive')

    expect(current_path).to eq '/mewments'
    expect(page).to have_content('you should be more pro-dog-tive')
  end
end
