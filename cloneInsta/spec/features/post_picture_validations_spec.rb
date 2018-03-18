feature 'Input is validated' do
  scenario 'user supplies an invalid url' do
    visit '/pictures/new'
    fill_in :"picture[url]", with: ''
    fill_in :"picture[comment]", with: "It won't work"
    click_button 'Save Picture'
    expect(page).to have_content "error prohibited"
  end
end
