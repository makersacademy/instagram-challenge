RSpec.describe 'visiting other pages', type: :feature do
  scenario "a user visits another user's profile" do
    sign_up_elodie
    post_picture_of_breakfast
    click_on 'Log out'

    sign_up_sam
    click_on 'Home'
    click_on 'Elodie'

    expect(page).to have_content "Elodie's feed"
    expect(page).to have_css "img[src*='avocado-on-toast.jpg']"
    expect(page).to have_content '#blessed'

    click_on 'Profile'
    expect(page).to have_content "Sam's feed"
  end
end
