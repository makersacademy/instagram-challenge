require 'rails_helper.rb'

feature "create posts" do

  context 'Creating posts' do
    scenario 'can create a new post' do
      sign_up_test
      visit '/'
      click_link 'New Post'
      attach_file('Image', "spec/files/images/maldives.jpeg")
      fill_in 'Caption', with: 'looks like paradise!'
      click_button 'Create Post'
      expect(page).to have_content('looks like paradise!')
      expect(page).to have_css("img[src*='maldives.jpeg']")
    end
  end

  context 'needs an image to create a post' do
    scenario 'can not create a new post' do
      sign_up_test
      visit '/'
      click_link 'New Post'
      fill_in 'Caption', with: "No picture given for this test"
      click_button 'Create Post'
      expect(page).to have_content("Your new post couldn't be created! Please check the form.")
    end
  end
end

#   feature 'Can view individual posts' do
#     scenario 'can click and view a single post' do
#       post = create(:post)

#       visit '/'
#       find(:xpath, "//a[contains(@href,'posts/1')]").click
#       expect(page.current_path).to eq(post_path(post))
#     end
#   end
# end