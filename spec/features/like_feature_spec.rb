require 'rails_helper'

feature 'Feature: likes' do

  let(:image_file_jpeg) { File.new('spec/features/Mountains.jpg') }

  context 'picture has likes' do

    before do
      sign_up
      @picture = @user.pictures.create(description: 'description', image: image_file_jpeg  )
      @like = @picture.likes.new
      @like.user = @user
      @like.save
    end

    context 'signed in' do

      scenario 'can click to add a new like, which increments the likes count',  js: true do
        visit pictures_path
        find(:css, '.add-new-like').click
        within(".likes") do
          expect(page).to have_content '1 like'
        end
      end

      scenario 'can see likes counter is 1' do
          visit('/')
          within('.likes') do
            expect(page).to have_content('1')
          end
      end
    end
  end
end
