require 'rails_helper'

feature 'mewments' do
  context 'no mewments have been added' do
    before {visit '/mewments'}
    scenario 'should display a prompt to add a mewment' do
      expect(page).to have_content 'Start preening your whiskers, kitty cats!'
    end
    scenario 'should display a link to add a mewment' do
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'Posting a mewment' do
    before {sign_up}
    scenario 'Uploading an image' do
      create_mewment("Feline so Cathletic", "Cathletes.jpg")
      expect(page).to have_css("img[src*='Cathletes']")
    end
    scenario 'creating a caption' do
      create_mewment("Feline so Cathletic", "Cathletes.jpg")
      expect(page).to have_content("Feline so Cathletic")
    end
    scenario 'creating super long caption' do
      create_mewment("spam comment"*15, "Cathletes.jpg")
      expect(page).to have_content("error")
    end
    context 'no image added' do
      scenario 'disallows caption-only posts' do
        visit('/mewments')
        click_link 'Post a picture'
        click_button('Create Mewment')
        expect(page).to have_content 'error'
      end
    end
  end

  context 'Edit' do
    before do
      sign_up
      create_mewment("Feline so Cathletic", "Cathletes.jpg")
      edit_caption('Check out my cataranga')
    end
    scenario 'caption updates' do
      expect(page).to have_content 'Check out my cataranga'
    end
    scenario 'redirects to home after edit' do
      expect(current_path).to eq '/mewments'
    end
  end

  context 'delete' do
    before do
      sign_up
      create_mewment("Am I Pawllywood ready or what", "Pawllywood.jpg")
      click_link 'Delete'
    end
    scenario 'removes the caption' do
      expect(page).not_to have_content 'Am I Pawllywood ready or what'
    end
    scenario 'removes the picture' do
      expect(page).not_to have_css("img[src*='Pawllywood']")
    end
    scenario 'informs post is gone' do
      expect(page).to have_content 'Paw-lease, that picture is gone'
    end
  end
end
