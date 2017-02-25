require 'rails_helper'

feature 'FEATURE: Comments' do

  let(:image_title) { "Beast and Magneto" }
  let(:image_desc) { "Two cheeky Rabbits" }
  let(:image_file_jpeg) { File.new('spec/fixture/test_rabbits.jpeg') }
  let(:comment_text) { 'Those rabbits look particularly cheeky.' }

  context 'viewing comments on home page' do

    before do
      test_user = create_test_user
      test_image = test_user.images.create(title: image_title, description: image_desc, image_file: image_file_jpeg)
      test_comment = test_image.comments.new(text: comment_text)
      test_comment.user = test_user
      test_comment.save
    end

    context 'not signed in' do
      scenario 'can see comments' do
        visit('/')
        within('ul') do
          expect(page).to have_content(comment_text)
          expect(page).to have_content('PhotoN3rd')
        end  
      end
    end
    context 'signed in' do
      scenario 'can see comments' do
        sign_up
        visit('/')
        within('ul') do
          expect(page).to have_content(comment_text)
          expect(page).to have_content('PhotoN3rd')
        end
      end
    end
  end

  context 'creating comments' do
    before do
      test_user = create_test_user
      test_image = test_user.images.create(title: image_title, description: image_desc, image_file: image_file_jpeg)
    end

    context 'not signed in' do
      scenario 'cannot select to add a comment' do
        visit('/')
        expect(page).not_to have_selector('.add-new-comment')
      end
    end
    context 'signed in' do
      scenario 'can select to add a comment' do
        sign_up
        visit('/')
        expect(page).to have_selector('.add-new-comment')
      end

      scenario 'can enter a new comment and see it on the screen, listed alongside the username', js: true do
        sign_up
        visit('/')
        fill_in :comment_text, with: 'Test comment'
        click_link('Post comment')
        within("ul") do
          expect(page).to have_content 'Test comment'
          expect(page).to have_content 'PhotoN3rd'
        end

      end

    end
  end
end
