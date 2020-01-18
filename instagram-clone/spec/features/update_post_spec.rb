RSpec.describe 'updating the description of a post', type: :feature do
  before do
    sign_up_sam
  end

  scenario 'a user wants to update their avocado post' do
    post_picture_of_breakfast
    click_on 'edit description'

    expect(find_field('description').value).to eq '#blessed'

    fill_in 'description', with: '#blessed #newyearnewme #healthiswealth #avocados'
    click_on 'Update'

    expect(page).to have_css "img[src*='avocado-on-toast.jpg']"
    expect(page).to have_content '#blessed #newyearnewme #healthiswealth #avocados'
  end

  scenario 'a user wants to update their dog post' do
    post_picture_of_dog
    click_on 'edit description'

    expect(find_field('description').value).to eq '#dogs'

    fill_in 'description', with: '#dogs #bestboi #likeforlike #woof'
    click_on 'Update'

    expect(page).to have_css "img[src*='some-dog.jpg']"
    expect(page).to have_content '#dogs #bestboi #likeforlike #woof'
  end

  it 'is not possible if the user is not the owner of the post' do
    post_picture_of_breakfast
    click_on 'Log out'

    sign_up_elodie
    click_on 'Home'
    expect(page).not_to have_content 'edit description'
  end
end
