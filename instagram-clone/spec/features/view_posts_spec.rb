RSpec.describe 'viewing posts', type: :feature do
  scenario 'a user wants to see all their posts in one place' do
    sign_up_sam
    post_picture_of_breakfast
    click_on 'Log out'

    sign_up_elodie
    post_picture_of_dog
    click_on 'Log out'

    log_in_sam

    expect(page).not_to have_css "img[src*='some-dog.jpg']"
    expect(page).not_to have_content '#dogs'

    expect(page).to have_css "img[src*='avocado-on-toast.jpg']"
    expect(page).to have_content '#blessed'

    click_on 'Log out'

    log_in_elodie

    expect(page).to have_css "img[src*='some-dog.jpg']"
    expect(page).to have_content '#dogs'

    expect(page).not_to have_css "img[src*='avocado-on-toast.jpg']"
    expect(page).not_to have_content '#blessed'
  end
end
