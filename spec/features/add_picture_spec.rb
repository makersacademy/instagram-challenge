feature 'adding a picture' do

  scenario 'someone can upload a picture file and then see it' do
    visit '/pictures/new'
    attach_file(:picture_image, File.expand_path("../../../app/assets/images/Scan0001.jpg", __FILE__))
    click_button 'upload pic'
    expect(page).to have_content "Scan0001.jpg"
  end

end
