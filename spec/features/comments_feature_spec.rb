require 'rails_helper'

feature 'commenting on pictures' do
  before do
    upload_image
  end

  let!(:testPic){ Picture.first }

  scenario 'allow users to comment on a picture using a form' do
    visit "/"
    click_link "Comment on picture"
    fill_in "Comment", with: "Love the diagram! #codingRules"
    click_button "Post comment"
    expect(page).to have_content "Love the diagram! #codingRules"
    expect(current_path).to eq '/pictures'
  end
end
