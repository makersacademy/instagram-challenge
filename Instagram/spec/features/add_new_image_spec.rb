require './spec/support/web_helpers'

feature 'add new image', js: true do

  scenario 'user fills in form to add image' do
    add_an_image_of_giraffe
    expect(page).to have_css("img[src*='Giraffe_CC.jpg']")
  end

  scenario 'image is added, and user is taken to correct page with image' do
    10.times do
      add_an_image_of_giraffe
    end
    add_an_image_of_alpaca
    expect(page).to have_css("img[src*='Alpaca_CC.jpeg']")
  end

end
