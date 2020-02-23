RSpec.describe 'reverse order', type: :feature do
  let(:an_hour_later) { Time.now.utc + 3600 }

  scenario 'a user wants to view their posts in reverse order' do
    sign_up_sam
    post_picture_of_breakfast

    Timecop.freeze an_hour_later do
      post_picture_of_dog
    end

    # Dog post should be at the top of the feed
    expect(page).to have_content "Log out\nSam's feed\n#dogs"
  end
end
