require 'rails_helper'

feature 'comments' do

  let!(:post) { create(:post) }
  let(:comment1) { build(:comment) }
  let(:comment2) { build(:comment) }

  context 'creating and reading comments' do
    scenario 'allows users to leave comment on post from index page' do
       visit '/posts'
       fill_in "comment[content]", with: comment2.content
       click_button 'Leave comment'
       expect(page).to have_content comment2.content
       expect(current_path).to eq "/posts"
    end

    scenario 'allows users to leave comment on post from post page' do
       visit '/posts'
       click_link "post#{post.id}"
       fill_in "comment[content]", with: comment2.content
       click_button 'Leave comment'
       expect(page).to have_content comment2.content
       expect(current_path).to eq "/posts/#{post.id}"
    end
  end

  context 'deleting comments' do

    before do
      comment1.post_id=post.id
      comment1.save
    end

    scenario 'deleting comment from index page' do
      visit '/posts'
      click_link 'Delete comment'
      expect(page).not_to have_content comment1.content
      expect(page).to have_content 'Comment deleted successfully'
      expect(current_path).to eq "/posts"
    end
    scenario 'deleting comment from post page', focus: true do
      visit '/posts'
      click_link "post#{post.id}"
      click_link 'Delete comment'
      expect(page).not_to have_content comment1.content
      expect(page).to have_content 'Comment deleted successfully'
      expect(current_path).to eq "/posts/#{post.id}"
    end
  end
end
