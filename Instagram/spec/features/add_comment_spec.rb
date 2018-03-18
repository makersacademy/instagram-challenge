require './spec/support/web_helpers.rb'

feature 'add comment', js: true do
  scenario 'user adds a comment to a picture' do
    add_an_image_of_lemur
    find("img[src*='Lemur.jpg']").click
    fill_in 'comment[comment]', with: 'Love this picture!'
    fill_in 'comment[commenter]', with: 'Bob'
    click_button('submit')
    expect(page).to have_content('Love this picture!')
  end
end
