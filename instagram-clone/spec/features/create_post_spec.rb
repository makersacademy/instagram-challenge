RSpec.describe 'creating a post', type: :feature do
  scenario 'a user creates a post' do
    sign_up_sam

    click_on 'New Post'
    attach_file('image', 'spec/images/avocado-on-toast.jpg')
    fill_in 'description', with: '#blessed'
    click_on 'Share'

    expect(page).to have_css("img[src*='avocado-on-toast.jpg']")
    expect(page).to have_content '#blessed'
  end
end
