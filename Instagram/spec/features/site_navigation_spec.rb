require './spec/support/web_helpers'

feature 'navigate site', js: true do
  scenario 'user on image page wants to go back to main listings' do
    add_an_image_of_lemur
    add_an_image_of_capybara
    find("img[src*='Capybara.jpg']").click
    click_link 'Back'
    expect(page).to have_css("img[src*='Lemur.jpg']")
  end
end
