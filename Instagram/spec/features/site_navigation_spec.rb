require './spec/support/web_helpers'

feature 'navigate site', js: true do
  scenario 'user on image page wants to go back to main listings' do
    add_an_image_of_giraffe
    add_an_image_of_alpaca
    find("img[src*='Giraffe_CC.jpg']").click
    click_link 'Back'
    expect(page).to have_css("img[src*='Alpaca_CC.jpeg']")
  end
end
