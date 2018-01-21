require './spec/rails_helper.rb'

feature 'Creating posts' do
  scenario 'Create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('post[image]', 'spec/files/images/crepes.jpg')
    fill_in 'post[caption]', with: 'Weekend Brunch #crepes'
    click_on 'Create Post'
    expect(page).to have_content('#crepes')
    expect(page).to have_css('img[src*="crepes.jpg"]')
  end
end
