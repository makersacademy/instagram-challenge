require 'rails_helper'

feature 'Comments' do

  before do
    sign_up_and_in('me@metest.com', 'thisisapassword', 'Viola')
    basic_new_upload('spec/support/photo_upload_placeholder.jpg',
                     'Amazing times')
  end


  context 'No user signed in' do

    scenario 'Error raised if an unsigned in user tries to comment' do
      sign_out
      visit '/'
      fill_in('Content', with: "Test comment")
      click_button "Give Gratification"
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end

  context 'User signed in' do

    before do
      @test_time = Time.new(2016, 03, 05, 13, 0, 0)
      Timecop.freeze(@test_time)
      fill_in('Content', with: "Test comment")
      click_button "Give Gratification"
    end

    after do
      Timecop.return
    end

    scenario 'Leaving a comment' do
      expect(page).to have_content 'Test comment'
    end

    scenario 'Leaving a more than one comment' do
      fill_in('Content', with: "Another test comment")
      click_button "Give Gratification"
      expect(page).to have_content 'Another test comment'
    end

    scenario 'The most recent comment seen at the bottom of page' do
      fill_in('Content', with: "Another test comment")
      click_button "Give Gratification"
      expect('Test comment').to appear_before 'Another test comment'
    end

    scenario 'Seeing who left the comment, when and where' do
      time_expected = time_ago_in_words(@test_time,
          :highest_measure_only => true,
          :vague => :seconds)
      expect(page).to have_content 'Viola'
      expect(page).to have_content "left comment #{time_expected} ago on 05/03/2016 at 01:00PM"
    end
  end

  context 'Interacting with comments' do

    before do
      fill_in('Content', with: "Test comment")
      click_button "Give Gratification"
    end

    scenario 'You can delete you own comments' do
      within(".comment_feed_info") do
        click_button 'Destroy the evidence'
        expect(page).not_to have_content "Test comment"
      end
      expect(page).to have_content 'It\'s like it never even existed'
    end

    scenario 'You cannot delete other peoples comments' do
      sign_out
      sign_up_and_in('me1@metest.com', 'thisisanotherpassword', 'Johny')
      within(".comment_feed_info") do
        click_button 'Destroy the evidence'
        expect(page).not_to have_content "Test comment"
      end
        expect(page).to have_content 'You can only delete your own comments'
    end
  end
end
