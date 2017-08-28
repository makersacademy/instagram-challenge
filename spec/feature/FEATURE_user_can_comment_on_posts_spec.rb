require 'rails_helper.rb'

feature 'Creating comments', js: true do
  let!(:post) { create(:post) }

  before do
    login(post.user)
  end

  scenario 'User can create a comment' do
    visit '/'
    within(:css, "div#post-#{post.id}") do
      fill_in 'comment[body]', with: "comment"
      within(:css, "div.form-group") do
        find('.comment_form').send_keys :return
      end
    end
    expect(page).to have_content('comment')
  end
end
