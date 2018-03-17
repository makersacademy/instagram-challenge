feature 'image has its own page' do
  scenario 'user clicks on image on homepage' do
    visit '/'
    find("table").click
    expect(page).to have_content("Raccoon with Pizza")
  end
end
