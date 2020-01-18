RSpec.describe 'updating the description of a post', type: :feature do
  scenario 'a user wants to update their avocado post' do
    sign_up_sam
    post_picture_of_breakfast
    click_on 'edit description'

    expect(find_field('description').value).to eq '#blessed'

    fill_in 'description', with: '#blessed #newyearnewme #healthiswealth #avocados'
    click_on 'Update'

    expect(page).to have_css("img[src*='avocado-on-toast.jpg']")
    expect(page).to have_content '#blessed #newyearnewme #healthiswealth #avocados'
  end

  scenario 'a user wants to update their dog post' do
    sign_up_sam
    post_picture_of_dog
    click_on 'edit description'

    expect(find_field('description').value).to eq '#dogs'

    fill_in 'description', with: '#dogs #bestboi #likeforlike #woof'
    click_on 'Update'

    expect(page).to have_css("img[src*='some-dog.jpg']")
    expect(page).to have_content '#dogs #bestboi #likeforlike #woof'
  end
end
