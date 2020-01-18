RSpec.describe 'deleting a post', type: :feature do
  scenario 'a user wants to delete a post' do
    sign_up_sam
    post_picture_of_breakfast
    post_picture_of_dog
    all('a', text: 'delete')[0].click

    expect(page).to have_css("img[src*='some-dog.jpg']")
    expect(page).to have_content '#dogs'

    expect(page).not_to have_css("img[src*='avocado-on-toast.jpg']")
    expect(page).not_to have_content '#blessed'
  end
end
