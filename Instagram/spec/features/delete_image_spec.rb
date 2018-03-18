require './spec/support/web_helpers'

feature 'delete an image', js: true do
  scenario 'user wants to delete an image' do
    add_an_image_of_lemur
    find("img[src*='Lemur.jpg']").click
    click_link('Delete image')
    expect(page).not_to have_css("img[src*='Lemur.jpg']")
  end
end
