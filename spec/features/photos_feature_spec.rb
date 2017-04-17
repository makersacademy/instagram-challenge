require 'rails_helper'



  context 'photos have been added' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest', :match => :prefer_exact)
      fill_in('Password confirmation', with: 'testtest', :match => :prefer_exact)
      click_button('Sign up')
      Photo.create(title: 'Test Photo')
    end

    context 'no photos have been added' do
      scenario 'should display a prompt to add a photo' do
        visit '/photos'
        expect(page).to have_link 'Add photo'
      end
    end

  context 'creating photos' do
    scenario 'can create a photo' do
      visit '/photos'
      click_link 'Add photo'
      attach_file('Image', 'spec/files/images/testimage.jpg')
      fill_in 'Title', with: 'Test Photo'
      click_button 'Create Photo'
      expect(page).to have_content('Test Photo')
      expect(page).to have_css("img[src*='testimage.jpg']")
    end

    scenario 'cannot create a photo without adding an image' do
      visit '/photos'
      click_link 'Add photo'
      fill_in 'Title', with: 'Test Photo'
      click_button 'Create Photo'
      expect(page).to have_content('You must add an image to create a photo')
    end

    scenario 'cannot create a photo without adding a title' do
      visit '/photos'
      click_link 'Add photo'
      attach_file('Image', 'spec/files/images/testimage.jpg')
      click_button 'Create Photo'
      expect(page).to have_content('You must add a title to create a photo')
    end
  end

  context 'view photos on the index' do
    scenario 'the index display exists' do
      photo_one = create(:photo, title: "first post")
      photo_two = create(:photo, title: "second post")
      visit '/'
      expect(page).to have_content("first post")
      expect(page).to have_content("second post")
      expect(page).to have_css("img[src*='testimage.jpg']")
    end

    scenario 'photos have the name of the user who created them' do
      photo_one = create(:photo, title: "first post")
      photo_two = create(:photo, title: "second post")
      visit '/'
      expect(page).to have_content("first post")
      expect(page).to have_content("second post")
      expect(page).to have_css("img[src*='testimage.jpg']")
    end

    xscenario 'can click on the image in the index and be taken to the photo' do
      photo_one = create(:photo, title: "first photo")
      visit '/'
      find(:xpath, "//a[contains(@href,'photos/108')]").click
      expect(page.current_path).to eq(photo_path(photo))
    end
  end

  context 'liking photos' do
    scenario 'The user can like a photo' do
      photo_one = create(:photo, title: "first post")
      visit '/'
      click_on 'first post'
      click_on 'like'
      expect(page).to have_content('1 like')
    end

    scenario 'The user can unlike a photo' do
      photo_one = create(:photo, title: "first post")
      visit '/'
      click_on 'first post'
      click_on 'like'
      click_on 'unlike'
      expect(page).not_to have_content('1 liked')
    end

    scenario 'The total number of likes are displayed' do
      photo_one = create(:photo, title: "first post")
      visit '/'
      click_on 'first post'
      click_on 'like'
      visit '/'
      expect(page).to have_content('1 like')
    end
  end
end
