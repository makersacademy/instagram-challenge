require 'rails_helper'

feature 'commenting' do
  before { Post.create description: "Nice", image:  File.open("#{Rails.root}/spec/fixtures/cat.png"), user: User.new }

  scenario 'allows users to comment using form' do
    visit posts_path
    sign_up('tiddles@cat.com')
    click_link('Comment')
    fill_in('Comment', with: 'Nice')
    click_button('Leave comment')

    expect(current_path).to eq posts_path
    expect(page).to have_content('Nice')
  end
end
