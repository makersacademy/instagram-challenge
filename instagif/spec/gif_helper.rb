def create_gif
  visit '/gifs'
  click_link 'Give a gif'
  fill_in 'Generator', with: 'Cat'
  click_button 'Create Gif'
end
