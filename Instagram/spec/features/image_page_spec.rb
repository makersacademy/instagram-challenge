require './spec/support/web_helpers'

feature 'image has its own page', js: true do
  scenario 'user clicks on image on homepage' do
    add_an_image_of_capybara
    find("img[src*='Capybara.jpg']").click
    expect(page).to have_content("Grumpy Capybara")
  end
end
