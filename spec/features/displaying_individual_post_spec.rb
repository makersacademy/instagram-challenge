require 'rails_helper.rb'

feature 'Can view individual posts' do
  scenario 'Can click and view an individual post' do
    post = create(:post)

    visit '/'
    find(:xpath, "./html/body/div[1]/div[1]/div[2]/a").click
    expect(page.current_path).to eq(post_path(post))
  end
end