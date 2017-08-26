require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'User can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/test.jpg")
    fill_in 'post[caption]', with: 'testing #test'
    click_button 'submit'
    expect(page).to have_content('testing #test')
    expect(page).to have_css("img[src*='test.jpg']")
  end
end
