require 'rails_helper.rb'


feature 'Comment on Pictures' do

  context 'User can comment on Pictures' do
    scenario 'User can comment on pics' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'Hello there new pic!'
    click_button 'Create Post'
    click_link 'Add comment'
    fill_in 'Name', with: 'Bea'
    fill_in 'Content', with: 'Nice pic!'
    click_button 'Create Comment'
    expect(page).to have_content('Bea')
    expect(page).to have_content('Nice pic!')
    end 
  end





end
