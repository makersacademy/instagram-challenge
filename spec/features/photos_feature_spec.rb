require 'rails_helper'

feature 'Homepage photo view' do
  context 'No photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/'
      expect(page).to have_content "Nobody is using our site :'("
      expect(page).to have_link 'InstaGratify'
    end
  end

  context 'Adding a new photo' do
    scenario 'User is not logged in' do
      visit '/'
      click_link 'InstaGratify'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
      expect(current_path).to eq '/users/sign_in'
      expect(page).not_to have_selector('img')
    end

    scenario 'User is logged in' do
      sign_up_and_in('me@metest.com', 'thisisapassword', 'Viola')
      basic_new_upload('spec/support/photo_upload_placeholder.jpg', 'Amazing times')
      expect(current_path).to eq '/photos'
      expect(page).to have_selector('img')
    end
  end

  context 'Viewing photos in the photo feed' do
    before do
      @test_time = Time.new(2016, 03, 5, 13, 0, 30)
      Timecop.freeze(@test_time)
      sign_up_and_in('me@metest.com', 'thisisapassword', 'Viola')
      basic_new_upload('spec/support/photo_upload_placeholder.jpg', 'Amazing times')
      sign_out
      Timecop.return
    end

    scenario 'Anybody see who posted the picture and their caption for it' do
      visit '/photos'
      expect(page).to have_content 'Amazing times'
      expect(page).to have_content 'Viola'
    end

    scenario 'Anybody how long ago a picture was posted' do
      time_expected = time_ago_in_words(@test_time,
          :highest_measure_only => true,
          :vague => :seconds)
      visit '/photos'
      expect(page).to have_content "Sought InstaGratification #{time_expected} ago"
    end

    scenario 'Anybody can see exactly when a picture was posted' do
      visit '/photos'
      expect(page).to have_content '1:00PM'
      expect(page).to have_content '05/03/2016'
      expect(page).to have_content 'Viola'
    end

    scenario 'The most recent photos are at the top of the page' do
      visit '/'
      sign_up_and_in('otherme@metest.com', 'thisisanotherpassword', 'Johny')
      basic_new_upload('spec/support/photo_upload_placeholder1.jpg', 'Cute kittens')
      expect('Cute kittens').to appear_before 'Amazing times'
    end
  end

  context 'Deleting and editing photos' do

    scenario 'user not logged in' do
      visit '/photos'
      expect(page).not_to have_content("Censor photo")
      expect(page).not_to have_content("Destroy the evidence")
    end

    context 'user logged in' do

      before do
        sign_up_and_in('me@metest.com', 'thisisapassword', 'Viola')
        basic_new_upload('spec/support/photo_upload_placeholder.jpg', 'Amazing times')
      end

      scenario 'edit and delete options only available on your own photos' do
        expect(page).to have_content("Censor photo")
        expect(page).to have_content("Destroy the evidence")
      end

      scenario 'deleting a photo' do
        click_link "Destroy the evidence"
        expect(page).not_to have_content "Amazing times"
        expect(page).to have_content 'It\'s like it never even existed.'
        expect(current_path).to eq '/photos'
      end

      scenario 'updating a photo' do
        click_link "Censor photo"
        fill_in('Caption', with: "Censored")
        click_button "Censor"
        expect(page).to have_content 'Don\'t worry, nobody will ever know.'
        expect(page).to have_content 'Censored'
        expect(page).not_to have_content "Amazing times"
        expect(current_path).to eq '/photos'
      end
    end
  end
end
