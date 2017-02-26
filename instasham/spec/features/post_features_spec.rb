feature 'Post' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post when logged in' do
      sign_up
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end
  context 'creating posts' do
    scenario 'user cannot post if they are not signed in' do
      visit '/'
      expect(page).not_to have_link 'Add a post'
    end
    scenario 'prompts user to fill out a form, then displays the new post' do
      sign_up
      create_post
      expect(page).to have_content 'Love my new trainers!'
      expect(current_path).to eq '/posts'
    end
    # it "creates a new post with a test image" do
    #   post = FactoryGirl.create(:post)
    #   visit new_post_path
    #   attach_file_for_direct_upload("#{Rails.root}/spec/support/images/avatar.jpg")
    #   upload_directly(ImageUploader.new, "Upload Image")
    #   fill_in "Caption", :with => post.caption
    #   click_button "Create Post"
    #   page.should have_content("Post was successfully created.")
    # end
  end
  context 'posts have been added' do
    before do
      sign_up
      create_post
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Love my new trainers!')
      expect(page).to have_xpath("//img[contains(@src,'image.jpg')]")
      expect(page).not_to have_content('No posts yet')
    end
  end
end
