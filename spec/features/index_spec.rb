feature 'check home page' do

  scenario 'home page has title' do
    visit '/'
    expect(page).to have_content('Instagram')
   end



end
