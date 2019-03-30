feature 'Welcome page:' do
  
  scenario 'can see welcome message' do
    visit '/'
    expect(page).to have_content 'Welcome to Influenstagram'
  end
end