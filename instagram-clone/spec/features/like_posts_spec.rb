RSpec.describe 'liking a post', type: :feature do
  scenario ' a user likes a post' do
    sign_up_sam
    post_picture_of_breakfast
    click_on 'Log out'

    sign_up_elodie
    click_on 'Home'
    click_on 'Like'

    expect(page).to have_content 'Elodie liked your post'
  end
end
