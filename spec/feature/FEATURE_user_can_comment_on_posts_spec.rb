require 'rails_helper.rb'

feature 'Creating comments' do
  let!(:post) { create(:post) }

  before do
    login(post.user)
  end

  scenario 'User can create a comment' do
    pending
    visit '/'
    within(:css, "div#post-#{post.id}") do
      fill_in 'comment[body]', with: "comment"
    end
    expect(page).to have_content('comment')
  end
end
