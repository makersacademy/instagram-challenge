require 'rails_helper'

feature 'commenting' do

  let!(:arches) { Picture.create(description: "Arches") }

  scenario 'allows users to leave comments' do
    visit '/pictures'
    click_link 'Arches'
    click_link 'Comment'
    expect(current_path).to eq "/pictures/#{arches.id}/comments/new"
    fill_in 'Comment', with: 'Great photo!'
    click_button 'Post'
    expect(page).to have_content 'Great photo!'
  end

end
