require 'rails_helper'

feature 'commenting' do
  before { Post.create description: "Nice", image:  File.open("#{Rails.root}/spec/fixtures/cat.png") }

  scenario 'allows users to comment using form' do
    visit posts_path
    click_link('Comment')
    fill_in('Comment', with: 'Nice')
    click_button('Leave comment')

    expect(current_path).to eq posts_path
    expect(page).to have_content('Nice')
  end
end
