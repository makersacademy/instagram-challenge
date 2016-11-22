require 'rails_helper'

feature 'commenting' do
  let!(:monkey) { Picture.create description: 'Monkey'}

  scenario 'allows users to leave commments' do
    visit '/pictures'
    click_link 'Leave Comment'
    fill_in "Comments", with: "Worst photo ever"
    click_button 'Leave Comment'

    expect(current_path).to eq "/pictures/#{monkey.id}"
    expect(page).to have_content "Worst photo ever"
  end

end
