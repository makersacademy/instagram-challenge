context 'pictures have been added' do
  before do
    Picture.create(title: 'Cat')
  end

  scenario 'display pictures' do
    visit '/pictures'
    expect(page).to have_content('Cat')
    expect(page).not_to have_content('No pictures yet')
  end
end
