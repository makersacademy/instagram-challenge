require 'rails_helper'

xfeature 'Index displays a list of posts' do
  scenario 'the index displays correctly created posts' do

    sign_up_test(email: 'test1@hotmail.com', user_name: 'test1' )
    create_post(caption: 'This is post one')
    click_link('Logout')

    sign_up_test(email: 'test2@hotmail.com', user_name: 'test2' )
    create_post(caption: 'This is the second post')

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='maldives']")
  end
end