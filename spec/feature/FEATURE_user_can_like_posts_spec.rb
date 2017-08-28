require 'rails_helper.rb'

feature 'Creating likes' do
  let!(:user) { create(:user) }

  before do
    login(user)
  end

  scenario 'User can like a post' do
    visit '/'
    find('#newpost').click
    attach_file('post[image]', "spec/files/images/test.jpg")
    fill_in 'post[caption]', with: 'testing #test'
    click_button 'submit'
    find('#unlike3').click
    visit '/'
    expect(page).to have_content('1 like')
  end
end
