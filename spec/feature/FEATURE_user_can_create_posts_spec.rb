require 'rails_helper.rb'

feature 'Creating posts' do
  let!(:user) { create(:user) }

  before do
    login(user)
  end

  scenario 'User can create a post' do
    visit '/'
    find('#newpost').click
    attach_file('post[image]', "spec/files/images/test.jpg")
    fill_in 'post[caption]', with: 'testing #test'
    click_button 'submit'
    expect(page).to have_content('testing #test')
    expect(page).to have_css("img[src*='test.jpg']")
    expect(page).to have_content("Tester")
  end
end
