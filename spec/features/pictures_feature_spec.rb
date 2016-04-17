require 'rails_helper'

feature 'Picture:' do
  context 'When no pictures added' do
    scenario 'prompts users to post a picture' do
      sign_up_jinis
      expect(page).to have_content 'No picture has been added'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'Posting a picture without a title' do
    let!(:pic){ Picture.create(title: '') }

    scenario 'displays a default name Untitled if title is empty' do
      visit picture_path(pic)
      expect(page).to have_content 'Untitled'
    end
  end

  context 'Posting a picture with image' do
    before do
      sign_up_jinis
      post_picture_with_image
    end

    scenario 'user must be signed in to post a picture' do
      click_link 'Sign out'
      expect(page).not_to have_link 'Post a picture'
    end

    scenario 'user can post a picture with title and image' do
      expect(page).to have_xpath("//a[contains(@text, 'Bird')]")
      expect(page).to have_xpath("//img[contains(@src, 'bird.png')]")
    end

    scenario 'user can click on an image link to view details' do
      image_with_link = find(:xpath, "//a[contains(@text, 'Bird')]")
      image_with_link.click
      expect(page).to have_content 'Bird'
      expect(page).to have_xpath("//img[contains(@src, 'bird.png')]")
    end
  end

  context 'Editing a picture' do
    let!(:pic){ Picture.create(title: 'No So Good Title') }

    before do
      sign_up_jinis
      edit_title
    end

    scenario 'user can edit picture title from picture page' do
      expect(current_path).to eq picture_path(pic)
      expect(page).to have_content 'Better title'
    end

    scenario 'edited title is reflected in the text of image link' do
      visit pictures_path
      expect(page).to have_xpath("//a[contains(@text, 'Better title')]")
    end
  end

  context 'Deleting a picture' do
    let!(:pic){ Picture.create(title: 'To be deleted')}

    scenario 'user can delete picture from picture page' do
      sign_up_jinis
      visit picture_path(pic)
      click_link 'Delete'
      expect(current_path).to eq pictures_path
      expect(page).to have_content 'Picture has been deleted'
      expect(page).not_to have_xpath("//a[contains(@text, 'To be deleted')]")
    end
  end
end
