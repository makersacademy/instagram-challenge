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
        expect(page).to have_content(comment_text)
      end
    end
    context 'signed in' do
      scenario 'can see comments' do
        sign_up
        visit('/')
        expect(page).to have_content(comment_text)
      end
    end
  end


end
