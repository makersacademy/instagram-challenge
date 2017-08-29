RSpec.feature 'Picture' do

  it 'allows user to upload a picture' do
    sign_up
    visit 'pictures/new'
    fill_in 'picture[title]', with: 'Test Title'
    fill_in 'picture[description]', with: 'Test Description'
    attach_file('picture_image', Rails.root + 'spec/files/test.png', visible: false)
    click_button 'Upload'
    expect(Picture.count).to eq 1
    expect(page).to have_content 'Test Title'
    expect(page).to have_content 'Test Description'
  end

end
