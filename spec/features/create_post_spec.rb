RSpec.describe 'creating a post', type: :feature do
  before do
    sign_up_sam
  end

  scenario 'a user creates a post' do
    click_on 'New Post'
    attach_file 'image', 'spec/images/avocado-on-toast.jpg'
    fill_in 'description', with: '#blessed'
    click_on 'Share'

    expect(page).to have_css "img[src*='avocado-on-toast.jpg']"
    expect(page).to have_content '#blessed'
  end

  describe 'post details' do
    before do
      post_picture_of_breakfast
    end

    scenario 'a user wants to see their name next to their posts' do
      click_on 'Home'

      expect(page).to have_content 'posted by Sam'
    end

    describe 'posted at' do
      let(:now) { Time.now.utc }
      let(:ten_minutes_from_now) { Time.now.utc + 600 }
      
      before do
        Timecop.freeze ten_minutes_from_now do
          post_picture_of_dog
        end
      end

      scenario 'a user wants to see the time their posts were created on their own pages' do
        expect(page).to have_content "on #{now.strftime '%d %b %Y at %H:%M'}"
        expect(page).to have_content "on #{ten_minutes_from_now.strftime '%d %b %Y at %H:%M'}"
      end

      scenario 'a user wants to see the time their posts were created on the main feed' do
        click_on 'Home'

        expect(page).to have_content "posted by Sam #{now.strftime '%d %b %Y at %H:%M'}"
        expect(page).to have_content "posted by Sam #{ten_minutes_from_now.strftime '%d %b %Y at %H:%M'}"
      end
    end
  end
end
