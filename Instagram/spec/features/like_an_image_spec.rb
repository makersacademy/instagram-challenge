require './spec/support/web_helpers'

feature 'like an image', js: true do
  scenario 'a user clicks "like" on an image' do
    add_an_image_of_lemur
    find("img[src*='Lemur.jpg']").click
    click_on 'Heart'
    expect(page).to have_content '1'
  end
end
