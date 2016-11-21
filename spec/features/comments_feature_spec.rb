require 'rails_helper'

feature 'commenting on pics' do
  before { add_a_pic }

  scenario 'allows users to leave a review using a form' do
    pic_path = "/pics/#{Pic.first.id}"
    visit pic_path
    fill_in 'Thoughts', with: "cool picture!"
    click_button 'Comment'

    expect(current_path).to eq pic_path
    expect(page).to have_content('cool picture!')
  end

end
