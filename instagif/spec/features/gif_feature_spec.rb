require 'rails_helper'

feature 'gifs' do
  context 'no gifs have been added' do
    scenario 'should display a prompt to add a gif' do
      visit '/gifs'
      expect(page).to have_content 'No gifs yet!'
      expect(page).to have_link 'Give a gif'
    end
  end

  context 'gifs have been added' do

    before do
      Gif.create( generator: 'cat', url: "http://media0.giphy.com/media/JIX9t2j0ZTN9S/200.gif")
    end

    scenario 'display gifs' do
      sign_up
      visit '/gifs'
      expect(page).to have_css("img[src*='giphy']")
    end
  end

  context 'creating gifs' do


    scenario 'user fills in phrase to generate gif, then sees gif displayed' do
      sign_up
      create_gif
      expect(current_path).to eq '/gifs'
      expect(page).to have_content 'Cat'
      expect(page).to have_css("img[src*='giphy']")
    end
  end

  scenario 'prevents user from creating a gif without supplying a generator string' do
    sign_up
    visit '/gifs'
    click_link 'Give a gif'
    click_button 'Create Gif'
    expect(current_path).to eq '/gifs/new'
    expect(page).to have_content 'No string given: please enter a string'
  end

  context 'viewing gifs' do
    let!(:cat_gif){Gif.create(url: "https://media4.giphy.com/media/JHCcEc9vLvHZS/200.gif", generator: 'Cat')}

    scenario 'let a user view a gif' do
      visit '/gifs'
      click_link 'Cat'
      expect(page).to have_content 'Cat'
      expect(page).to have_css "img[src='https://media4.giphy.com/media/JHCcEc9vLvHZS/200.gif']"
      expect(current_path).to eq "/gifs/#{cat_gif.id}"
    end
  end

  context 'deleting gifs' do


    scenario 'removes a gif when a user clicks a delete link' do
      sign_up
      create_gif
      visit '/gifs'
      click_link 'Cat'
      click_link 'Delete Gif'
      expect(page).not_to have_content 'Cat'
      expect(page).to have_content 'Gif is gone for good'
    end
  end
end
