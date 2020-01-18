RSpec.describe 'viewing posts', type: :feature do
  scenario 'a user wants to see all their posts in one place' do
    sign_up_sam
    post_picture_of_breakfast

    sign_up_elodie
    post_picture_of_dog

    visit '/'
    click_on 'Log in'
    fill_in 'email', with: 'sam@example.com'
    fill_in 'password', with: '1234icecream'
    click_on 'Log in'

    expect(page).not_to have_css("img[src*='some-dog.jpg']")
    expect(page).not_to have_content '#dogs'

    expect(page).to have_css("img[src*='avocado-on-toast.jpg']")
    expect(page).to have_content '#blessed'

    visit '/'
    click_on 'Log in'
    fill_in 'email', with: 'elodie@example.com'
    fill_in 'password', with: '1234icecream'
    click_on 'Log in'

    expect(page).to have_css("img[src*='some-dog.jpg']")
    expect(page).to have_content '#dogs'

    expect(page).not_to have_css("img[src*='avocado-on-toast.jpg']")
    expect(page).not_to have_content '#blessed'
  end
end