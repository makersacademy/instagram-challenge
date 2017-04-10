require 'rails_helper'

feature 'Feature: likes' do

  let(:image_file_jpeg) { File.new('spec/features/Mountains.jpg') }

  context 'adding likes has likes' do

    before do
      sign_up
      picture = @user.pictures.create(description: 'description', image: image_file_jpeg  )
    end



    context 'signed in' do

      scenario 'can click to add a new like, which increments the likes count',  js: true do
        visit pictures_path
        find(:css, '.add-new-like').click
        within('.likes') do
           expect(page).to have_content('1')
         end
      end
    end

    context 'not signed in' do
      scenario 'cannot select to add a like' do
        click_link "Log out"
        visit('/')
        expect(page).not_to have_selector('.add-new-like')
      end
    end
  end
end
