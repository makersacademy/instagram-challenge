RSpec.describe 'comments', type: :feature do
  before do
    sign_up_sam
    post_picture_of_breakfast
    click_on 'Log out'

    sign_up_elodie
    click_on 'Home'
    fill_in 'body', with: 'I, too, love avocados.'
    click_on 'Post'
  end

  scenario 'a user wants to comment on a post' do
    expect(page).to have_css "img[src*='avocado-on-toast.jpg']"
    expect(page).to have_content 'Elodie ~ I, too, love avocados.'
  end

  scenario 'a user wants to delete their comment' do
    click_on 'delete comment'
    
    expect(page).to have_css "img[src*='avocado-on-toast.jpg']"
    expect(page).not_to have_content 'Elodie ~ I, too, love avocados.'
  end
end
