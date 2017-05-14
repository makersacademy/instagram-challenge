require 'rails_helper'

feature 'reviewing' do
  let!(:cat_gif){Gif.create(url: "https://media4.giphy.com/media/JHCcEc9vLvHZS/200.gif", generator: 'Cat')}

  scenario 'allows users to leave a comment on a gif using a form' do
    visit '/gifs'
    click_link 'Cat'
    fill_in 'Comment', with: "Nice cat!"
    click_button 'Add Comment'
    expect(current_path).to eq "/gifs/#{cat_gif.id}"
    expect(page).to have_content('Nice cat!')
  end
end
