require 'rails_helper'

feature 'comment' do
  before do
    sign_up
    create_mewment('Just pro-cat-tinating', 'Cathletes.jpg')
  end

  scenario 'write a comment on a mewment' do
    add_comment('you should be more pro-dog-tive')

    expect(current_path).to eq '/mewments'
    expect(page).to have_content('you should be more pro-dog-tive')
  end
end
