feature 'Posts' do

  context 'when signed in' do
    before do
      sign_up
      create_post
    end

    context 'adding' do
      scenario "user can add a post" do
        expect(current_path).to eq posts_path
        expect(page).to have_content "Beautiful Sunset"
        expect(page).to have_content "bob: blah blah blah blah"
        expect(page).to have_css "img[alt='Image']"
      end

      scenario "all fields are required" do
        click_link "Add post"
        click_button 'Create Post'
        expect(page).to have_content "Title can't be blank"
        expect(page).to have_content "Description can't be blank"
        expect(page).to have_content "Image can't be blank"
      end
    end

    context 'editing' do
      scenario 'user can edit title and description of own posts' do
        click_link 'Edit post'
        fill_in :Title, with: "New title"
        fill_in :Description, with: "Some stuff"
        click_button 'Update Post'
        expect(page).not_to have_content "Beautiful Sunset"
        expect(page).not_to have_content "blah blah blah blah"
        expect(page).to have_content "New title"
        expect(page).to have_content "Some stuff"
      end

      scenario "can't edit other users posts" do
        click_link 'Sign out'
        sign_up email: "bob@ross.com"
        expect(page).not_to have_link 'Edit post'
      end

    end

    context 'deleting' do
      scenario 'user can delete their own posts' do
        click_link 'Delete post'
        expect(page).not_to have_content "Beautiful Sunset"
        expect(page).not_to have_content "blah blah blah blah"
      end

      scenario "can't delete other users posts" do
        click_link 'Sign out'
        sign_up email: "bob@ross.com"
        expect(page).not_to have_link 'Delete post'
      end
    end

  end
  context 'when not sign in' do

    before do
      sign_up
      create_post
      click_link 'Sign out'
      visit posts_path
    end

    scenario "can't add posts" do
      expect(page).not_to have_link "Add post"
    end

    scenario "can't edit posts" do
      expect(page).not_to have_link "Edit post"
    end

    scenario "can't delete posts" do
      expect(page).not_to have_link "Delete post"
    end
  end
end
