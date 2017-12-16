feature 'testing infrastructure' do
  scenario 'testing infrastructure is working' do
    visit '/'
    expect(page).to have_content("Hello")
  end
end
