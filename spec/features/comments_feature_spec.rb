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

end
