feature 'Opening the index page' do
  scenario 'can visit the index page' do
    visit('/')
    expect(page).to have_content('Welcome')
  end
end
