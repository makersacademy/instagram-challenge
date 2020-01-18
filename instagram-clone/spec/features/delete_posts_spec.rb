RSpec.describe 'deleting a post', type: :feature do
  before do
    sign_up_sam
    post_picture_of_breakfast
  end

  scenario 'a user wants to delete a post' do
    post_picture_of_dog
    all('a', text: 'delete')[0].click

    expect(page).to have_css "img[src*='some-dog.jpg']"
    expect(page).to have_content '#dogs'

    expect(page).not_to have_css "img[src*='avocado-on-toast.jpg']"
    expect(page).not_to have_content '#blessed'
  end

  it 'is not possible if the user is not the owner of the post' do
    click_on 'Log out'

    sign_up_elodie
    click_on 'Home'
    expect(page).not_to have_content 'delete'
  end
end
