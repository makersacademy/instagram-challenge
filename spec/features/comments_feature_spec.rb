require 'rails_helper'

feature 'commenting' do
  before do
    add_new_post
  end

  scenario 'let user state his opinion' do
    add_new_comment('mouth watering')
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'mouth watering'
  end

  scenario 'throw an error if opinion is less than 3 letters long' do
    comment = add_new_comment('hi')
    expect(page).to have_content 'Sorry! your comment must be more than 3 letters long'
  end

end
