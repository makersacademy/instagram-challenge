require 'rails_helper'

feature 'comments' do

  let!(:post) { create(:post) }
  let(:comment) { build(:comment) }

  scenario 'allows users to leave comment on post', focus: true do
     visit '/posts'
     fill_in "comment[content]", with: comment.content
     click_button 'Leave comment'
     expect(page).to have_content comment.content
  end

end
