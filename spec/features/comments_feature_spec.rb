require 'rails_helper'

feature "Feature: commenting" do

  let(:image_file_jpeg) { File.new('spec/features/Mountains.jpg') }

  context 'creating comments on home page' do
    before do
      sign_up
      @picture = @user.pictures.create(description: 'description', image: image_file_jpeg  )
    end

    scenario "allows users to leave comments on pictures" do
      visit '/'
      fill_in "Thoughts", with: "Nice"
      click_button 'Comment'
      expect(current_path).to eq '/'
      expect(page).to have_content('Nice')
    end

    scenario 'does not allow users to leave a comment using a form when not signed in' do
      click_link('Log out')
      expect(page).not_to have_content('Leave comment')
    end
  end


end
