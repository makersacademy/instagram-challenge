require 'rails_helper'

feature 'Can view individual posts' do
  scenario 'Can click and view an individual post' do
    post = create(:post)

    visit '/'
    find(:xpath, './html/body/div[1]/section[1]/a').click
    expect(page.current_path).to(eq(post_path(post)))
  end
end
