feature 'List all' do
  scenario 'all posts can be seen in a list' do
    visit '/pictures/new'
    fill_in :"picture[url]", with: 'https://i.imgur.com/B8p2zl0.jpg'
    fill_in :"picture[comment]", with: 'coooool cat'
    click_button 'Save Picture'
    visit '/pictures/new'
    fill_in :"picture[url]", with: 'https://i.imgur.com/KQPxdLJ.jpg'
    fill_in :"picture[comment]", with: 'swirley'
    click_button 'Save Picture'
    visit '/pictures'
    expect(page).to have_content 'coooool cat'
    expect(page).to have_content 'swirley'
  end
end
