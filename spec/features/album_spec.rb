RSpec.feature 'Album' do

  it 'allows user to create an album' do
    sign_up
    add_album
    expect(Album.first.title).to eq 'Test Title'
    expect(page).to have_content 'Test Title'
    expect(page).to have_content 'This is the description of the test album'
  end

  describe 'album#index' do
    it 'shows all the user\'s albums' do
      sign_up
      add_album
      add_album(title: "Test Title 2", description: "This is the description of the test album number 2")
      visit '/albums'
      expect(page).to have_content 'Test Title'
      expect(page).to have_content 'Test Title 2'
    end
  end

end
