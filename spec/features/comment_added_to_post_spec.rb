require 'rails_helper.rb'

feature 'Comments' do
  scenario 'user can add a comment to a post' do
    create_post
    click_button "Comment"
    fill_in :comment_comment_text, with: 'This is the greatest photo I have ever seen #wherecaninominateyouforanaward'
    click_button "Post"
    click_on(class: 'comment-count btn btn-outline-info')
    expect(page).to have_content("#wherecaninominateyouforanaward")
  end

  scenario 'user can view comments on a post' do

  end
end
