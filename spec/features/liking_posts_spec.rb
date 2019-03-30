require 'rails_helper.rb'

feature 'Liking pictures' do

  context 'Liking pictures' do
    scenario 'A user can Like a picture with the number of likes displayed' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'Hello there new pic!'
    click_button 'Create Post'
    click_link 'Like post'
    expect(page).to have_content('Likes: 1')
    expect(page).to have_content('No comments')


    end





  end




end
