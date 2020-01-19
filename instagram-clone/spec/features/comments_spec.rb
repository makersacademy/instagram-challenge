RSpec.describe 'comments', type: :feature do
  scenario 'a user wants to comment on a post' do
    sign_up_sam
    post_picture_of_breakfast
    click_on 'Log out'

    sign_up_elodie
    click_on 'Home'
    fill_in 'body', with: 'I, too, love avocados.'
    click_on 'Post'

    expect(page).to have_css "img[src*='avocado-on-toast.jpg']"
    expect(page).to have_content 'Elodie ~ I, too, love avocados.'
  end
end
