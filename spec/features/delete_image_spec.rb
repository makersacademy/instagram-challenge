require './spec/support/web_helpers'

feature 'delete an image', js: true do
  scenario 'user wants to delete an image' do
    add_an_image_of_giraffe
    find("img[src*='Giraffe_CC.jpg']").click
    click_link('Delete image')
    expect(page).not_to have_css("img[src*='Giraffe_CC.jpg']")
  end
end
