feature 'View photos', js: true do
  scenario 'Photo index page has added photos' do
    create(:photo)
    visit '/photos'
    expect(page.text).to include('no filter')
    expect(page).to have_css("img[src*='photo']")
  end
end
