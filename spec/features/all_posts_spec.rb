RSpec.describe 'all posts', type: :feature do
  scenario 'a user wants to see all posts' do
    sign_up_sam
    post_picture_of_breakfast
    click_on 'Log out'

    sign_up_elodie
    post_picture_of_dog
    click_on 'Home'
    
    expect(page).to have_css "img[src*='some-dog.jpg']"
    expect(page).to have_css "img[src*='avocado-on-toast.jpg']"
  end
end
