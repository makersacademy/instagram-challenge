require 'rails_helper.rb'

feature 'Creating Posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'caption', with: "This looks amaaazing"
    click_button 'Create Post'
    expect(page).to have_content "Halt, you fiend! You need an image to post here!"
  end



end