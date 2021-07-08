feature 'Comments' do
  scenario 'users can comment on posts' do
    visit 'pictures/new'
    fill_in :"picture[url]", with: 'https://i.imgur.com/B8p2zl0.jpg'
    fill_in :"picture[comment]", with: 'coooool cat'
    click_button 'Save Picture'
    fill_in :"comment[commenter]", with: 'Noel'
    fill_in :"comment[body]", with: 'amazing cat'
    click_button 'Create Comment'
    expect(page).to have_content 'Noel'
    expect(page).to have_content 'amazing cat'
  end
end
