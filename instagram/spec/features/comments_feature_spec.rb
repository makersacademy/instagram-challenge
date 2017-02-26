require 'rails_helper'
require_relative '../helpers/sign_helpers'

feature 'comments' do

  before do
    signup1
    @user = User.find_by_email("test@example.com")
  end

  context 'no comments have been added' do

    scenario 'should display a prompt to add a comment' do
      @user.images.create(caption:'test1', image: File.new(Rails.root + 'public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg'))
      visit '/images'
      click_link 'test1'
      expect(page).to have_content 'No comments yet'
      expect(page).to have_link 'Comment'
    end
  end

  context 'comments have been added' do
    let!(:test1){ @user.images.create(caption:'test1', image: File.new(Rails.root + 'public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg'), id: 1)}

    scenario 'allows users to leave a comment using a form' do
       visit '/images'
       click_link 'test1'
       click_link 'Comment'
       fill_in "Comment", with: "so so"
       click_button 'Leave Comment'

       expect(current_path).to eq "/images/#{test1.id}"
       expect(page).to have_content('so so')
    end

    scenario 'allows users to leave multiple comments using a form' do
       visit '/images'
       click_link 'test1'
       click_link 'Comment'
       fill_in "Comment", with: "so so"
       click_button 'Leave Comment'
       click_link 'Comment'
       fill_in "Comment", with: "yeaha"
       click_button 'Leave Comment'

       expect(current_path).to eq "/images/#{test1.id}"
       expect(page).to have_content('so so')
       expect(page).to have_content('yeaha')
    end
  end
end
