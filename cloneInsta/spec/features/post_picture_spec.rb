feature 'Post picture' do
  scenario 'users can enter url of image with a comment' do
    visit '/'
    fill_in :"picture[url]", with: 'https://i.imgur.com/B8p2zl0.jpg'
    fill_in :"picture[comment]", with: 'coooool cat'
    click_button 'Submit'
    expect(page).to have_xpath "//img[@src='https://i.imgur.com/B8p2zl0.jpg']"
    expect(page).to have_content "coooool cat"
  end
end
