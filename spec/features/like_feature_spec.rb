require 'rails_helper'

feature 'Feature: likes' do

  let(:image_file_jpeg) { File.new('spec/features/Mountains.jpg') }

  context 'signed in' do
    before do
      sign_up
      @picture = @user.pictures.create(description: 'description', image: image_file_jpeg  )
      @like = @picture.likes.create

    end

      scenario 'can click to add a new like' do
        visit pictures_path
        find(:css, '.add-new-like').click
        within(".like-button") do
        expect(page).to have_content '1 like'
        end
      end
  end
end
