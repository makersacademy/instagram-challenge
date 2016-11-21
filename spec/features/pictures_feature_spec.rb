require 'rails_helper'

feature 'pictures' do

  before do
    sign_in('test@test.com', 'testpassword')
    @user = User.create(email: 'abc@123.com', password: '123456')
  end

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'adding a picture' do
    scenario 'lets a user add a picture' do
      add_picture('Gorgeous cat cat')
      expect(current_path).to eq '/pictures'
      expect(page).to have_content 'Gorgeous cat cat'
    end
  end

  context 'viewing pictures' do
    let!(:kitty){ @user.pictures.create(description:'Kitty cat') }
    scenario 'lets a user view a picture' do
      visit_picture('Kitty cat')
      expect(page).to have_content 'Kitty cat'
      expect(current_path).to eq "/pictures/#{kitty.id}"
    end
  end

  context 'editing pictures' do
    before { @user.pictures.create(description: 'Kitty cat') }
    scenario 'lets a user edit a picture' do
      visit_picture('Kitty cat')
      click_link 'Edit'
      fill_in 'Description', with: 'Gorgeous cat cat'
      click_button 'Edit picture'
      expect(current_path).to eq '/pictures'
      expect(page).to have_content 'Gorgeous cat cat'
      expect(page).not_to have_content 'Kitty cat'
    end
  end

  context 'deleting pictures' do
    before { @user.pictures.create(description: 'Kitty cat') }
    scenario 'removes a picture when a user clicks delete' do
      visit_picture('Kitty cat')
      click_link 'Delete'
      expect(current_path).to eq '/pictures'
      expect(page).to have_content 'Picture deleted successfully'
      expect(page).not_to have_content 'Kitty cat'
    end
  end
end
