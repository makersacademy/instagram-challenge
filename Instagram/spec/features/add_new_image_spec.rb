feature 'add new image', js: true do

  scenario 'user fills in form to add image' do
    add_an_image_of_capybara
    expect(page).to have_css("img[src*='Capybara.jpg']")
  end

  scenario 'image is added, and user is taken to correct page with image' do
    10.times do
      add_an_image_of_capybara
    end
    add_an_image_of_lemur
    expect(page).to have_css("img[src*='Lemur.jpg']")
  end
  
end
