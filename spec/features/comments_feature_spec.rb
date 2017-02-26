require 'rails_helper'

feature 'FEATURE: Comments' do

  let(:image_title) { "Beast and Magneto" }
  let(:image_desc) { "Two cheeky Rabbits" }
  let(:image_file_jpeg) { File.new('spec/fixture/test_rabbits.jpeg') }
  let(:comment_text) { 'Those rabbits look particularly cheeky.' }

  context 'no comments yet added' do
    before do
      test_user = create_test_user
      test_image = test_user.images.create(title: image_title, description: image_desc, image_file: image_file_jpeg)
    end
    scenario 'See a no comments message' do
      visit('/')
      expect(page).to have_content('No comments yet')
    end
  end

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
        within("#main_container") do
          expect(page).to have_content(comment_text)
          expect(page).to have_content('PhotoN3rd')
        end
      end
    end
    context 'signed in' do
      scenario 'can see comments' do
        sign_up
        visit('/')
        within("#main_container") do
          expect(page).to have_content(comment_text)
          expect(page).to have_content('PhotoN3rd')
        end
      end
      context '"no comments yet" message' do
        scenario 'no longer visible' do
          visit('/')
          expect(page).not_to have_content('No comments yet')
        end
      end

    end
  end

  context 'creating comments' do

    context 'not signed in' do
      before do
        test_user = create_test_user
        test_image = test_user.images.create(title: image_title, description: image_desc, image_file: image_file_jpeg)
      end
      scenario 'cannot select to add a comment' do
        visit('/')
        expect(page).not_to have_selector('.add-new-comment')
      end
    end
    context 'signed in' do
      before(:each) do
        test_user = create_test_user
        test_image = test_user.images.create(title: image_title, description: image_desc, image_file: image_file_jpeg)
      end
      scenario 'can select to add a comment', js: true do
        sign_up
        visit('/')
        expect(page).to have_selector('.add-new-comment')
      end

      scenario 'can CLICK submit first comment and see it on the screen', js: true do
        sign_up
        visit('/')
        fill_in :comment_text, with: 'Test comment'
        click_link('Post')
        within("#main_container") do
          expect(page).to have_content 'Test comment'
          expect(page).to have_content 'PhotoN3rd'
        end
      end
      scenario 'can PRESS ENTER submit a first comment and see it on the screen', js: true do
        sign_up
        visit('/')
        fill_in :comment_text, with: "Test comment"
        find('.new-comment-field').native.send_keys :enter
        within("#main_container") do
          expect(page).to have_content 'Test comment'
          expect(page).to have_content 'PhotoN3rd'
        end
      end
      scenario 'On creation of first commment, "No comments yet" message is removed', js: true do
        sign_up
        visit('/')
        fill_in :comment_text, with: 'Test comment'
        click_link('Post')
        within("#main_container") do
          expect(page).not_to have_content 'No comments yet'
        end
      end
      scenario 'Comment input field text goes blank when field is clicked', js: true do
        sign_up
        visit('/')
        field = find_field(:comment_text)
        field.trigger("click")
        expect(field.value).to eq ''
      end
      scenario 'Comment input field resets to "Type commment here" after submission', js: true do
        sign_up
        visit('/')
        fill_in :comment_text, with: 'Test comment'
        click_link('Post')
        expect(page).not_to have_content 'No comments yet'
        field = find_field(:comment_text)
        expect(field.value).to eq 'Type a comment here…'
      end
    end
  end
end
