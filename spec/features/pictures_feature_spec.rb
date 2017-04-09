require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been uploaded' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  # def signed_in_as_a_valid_user
  #   @user ||= User.create :user
  #   sign_in @user # method from devise:TestHelpers
  #   post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
  # end


  context 'Signing Up' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      @pictures = Picture.create(image: File.new('spec/fixtures/image.jpeg'), description: 'London')

      #  Picture.create(description: 'London')

      # @pictures = Picture.all
      # p @pictures.image = File.new('spec/fixtures/image.jpeg')
        # p @pictures.description
      #  p @pictures.image
      # p @image = { :image => File.open(File.join(Rails.root, 'spec', 'fixtures', 'image.jpeg')) }
    end

    # unsure how to write test testing paperclip upload

    # scenario 'displays image' do
    #   visit '/pictures'
    #   # Picture.create :image => File.open(File.join(Rails.root, 'spec', 'fixtures', 'image.jpeg'))
    #   expect(page).to have_css("img[src*='imagename.jpg']")
    # end

    scenario 'display picture description' do
      visit '/'
      click_link 'Add a picture'
      fill_in('Description', with: "This is my test" )
      click_button('Create Picture')
      expect(page).to have_content('This is my test')
      expect(page).to_not have_content('No pictures yet')
    end
  end
end
