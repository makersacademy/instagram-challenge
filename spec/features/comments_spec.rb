require 'rails_helper'

describe 'Commenting' do
  before { Post.create description: "monkey" }

  scenario 'allows users to comment on posts' do
    sign_in
    click_link('Leave comment')
    fill_in("Comment", with: "Amazing photo")
    click_button('Leave comment')

    expect(current_path).to eq "/posts/#{Post.last.id}"
    expect(page).to have_content("Amazing photo")
  end
end
