require 'spec_helper'

# feature 'Can view individual posts' do
#   scenario 'Can click and view a single post' do
#     post = create(:post)
#
#     visit edit_post_path(post)
#     # find(:xpath, "//a[contains(@href,'/posts/1')]").click
#     expect(page.current_path).to eq(post_path(post))
#   end
# end

feature 'Editing posts' do
  before do
    job = create(:post)

    visit edit_post_path(job)
    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end

  # scenario "won't update a post without an image" do
  #   attach_file('Image', 'spec/files/coffee.zip')
  #   click_button 'Update Post'
  #   expect(page).to have_content("Something is wrong with your form!")
  # end
end
