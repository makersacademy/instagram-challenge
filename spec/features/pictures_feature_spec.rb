require 'rails_helper'

feature 'Picture:' do
  context 'When no pictures added' do
    scenario 'prompts users to post a picture' do
      visit pictures_path
      expect(page).to have_content 'No picture has been added'
      expect(page).to have_link 'Post a picture'
    end
  end

  context "Posting a picture with image" do
    before { post_picture_with_image }

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
    let!(:pic){ Picture.create(title: 'No So Good Title')}
    before { edit_title }

    scenario 'user can edit picture title from picture page' do
      expect(current_path).to eq picture_path(pic)
      expect(page).to have_content 'Better title'
    end

    scenario 'edited title is reflected in the text of image link' do
      visit pictures_path
      expect(page).to have_xpath("//a[contains(@text, 'Better title')]")
    end
  end
end
