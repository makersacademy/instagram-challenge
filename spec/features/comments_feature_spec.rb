require 'rails_helper'

feature 'reviewing' do

  let!(:banana) { Image.create(image: File.open("#{Rails.root}/spec/images/banana.jpeg"), description: "Banana") }

  scenario 'allows users to leave a comment' do
    visit "images/#{banana.id}"
    click_link 'Comment'
    fill_in 'Comment', with: "Nice Banana"
    click_button "Comment"
    expect(current_path).to eq "/images/#{banana.id}"
    expect(page).to have_content "Nice Banana"
  end

end
