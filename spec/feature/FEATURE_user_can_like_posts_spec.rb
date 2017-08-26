require 'rails_helper.rb'

feature 'Creating likes' do
  scenario 'User can like a post' do
    visit '/'
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/test.jpg")
    fill_in 'post[caption]', with: 'testing #test'
    click_button 'submit'
    click_button 'Like'
    expect(page).to have_content('1 like')
  end
end
