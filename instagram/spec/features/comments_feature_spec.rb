require 'rails_helper'

feature 'comments' do

  context 'no comments have been added' do
    before {Image.create(caption:'test1', image: File.new(Rails.root + 'public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg'))}

    scenario 'should display a prompt to add a image' do
      visit '/images'
      click_link 'test1'
      expect(page).to have_content 'No comments yet'
      expect(page).to have_link 'Comment'
    end
  end

  context 'comments have been added' do
    let!(:test1){ Image.create(caption:'test1', image: File.new(Rails.root + 'public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg'), id: 1)}

    scenario 'allows users to leave a comment using a form' do
       visit '/images'
       click_link 'test1'
       click_link 'Comment'
       fill_in "Comment", with: "so so"
       click_button 'Leave Comment'

       expect(current_path).to eq "/images/#{test1.id}"
       expect(page).to have_content('so so')
    end
  end
end
