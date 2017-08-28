feature 'Photo' do
  it 'can create a photo' do
    visit 'photos/new'
    attach_file('photo_image', Rails.root + 'spec/files/test.png', visible: false)
    click_button 'Upload'
    expect(Photo.count).to eq 1
  end
end
