require 'rails_helper'

feature 'Pictures' do

  let(:user) do
    create :user
  end

  context 'no pictures have been added' do
    scenario 'should display a prompt to upload a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_content 'Upload picture'
    end
  end

  context 'adding pictures' do
    it 'is not valid with no description' do
      picture = Picture.new(description: "")
      expect(picture).to have(1).error_on(:description)
      expect(picture).not_to be_valid
    end
  end

  context 'pictures have been added' do

    before do
      sign_in user
    end

    scenario 'displays pictures' do
      add_photo('spec/images/sanj.jpeg', 'Sanjay!')
      expect(current_path).to eq '/pictures'
      expect(page).not_to have_content 'No pictures yet'
      expect(page).to have_css 'img.uploaded-pic'
      expect(page).to have_content 'Sanjay!'
    end
  end

  context 'viewing pictures' do

    let!(:arches) { Picture.create(picture: File.open("#{Rails.root}/spec/images/arches.jpeg"), description: "Arches", user: user) }

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link "#{arches.description}"
      expect(current_path).to eq "/pictures/#{arches.id}"
    end
  end

  context 'when signed in a user can' do

    let!(:zion) { Picture.create(picture: File.open("#{Rails.root}/spec/images/zion.jpg"), description: "Zion", user: user) }

    before do
      sign_in user
    end

    scenario "edit their picture's description" do
      visit '/pictures'
      click_link "#{zion.description}"
      click_link "Edit"
      fill_in 'Description', with: 'Zion National Park'
      click_button 'Update'
      expect(current_path).to eq "/pictures/#{zion.id}"
      expect(page).to have_content 'Zion National Park'
    end

    scenario "delete their picture" do
      visit '/pictures'
      click_link "#{zion.description}"
      click_link "Delete"
      expect(page).not_to have_content 'Zion'
      expect(page).to have_content 'Picture deleted successfully'
    end

  end

  context 'users cannot' do

    let :malicious_user do
      create(:user, username: 'bad_user', email: 'bad_user@example.com')
    end

    before do
      sign_in(user)
      add_photo('spec/images/yosemite02.jpg', 'Yosemite')
      sign_out
      sign_in(malicious_user)
    end

    scenario "edit other users' pictures" do
      click_link('Yosemite')
      expect(page).not_to have_content 'Edit'
    end

    scenario "delete other users' pictures" do
      click_link('Yosemite')
      expect(page).not_to have_content 'Delete'
    end
  end
end
