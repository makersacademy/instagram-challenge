feature 'Posts' do
  context 'no posts have been added' do
    it "has a link to add posts" do
      visit posts_path
      expect(page).to have_link "Add post"
    end
  end

  context 'when signed in' do

    before do
      sign_up
      create_post
    end

    context 'adding' do
      it "user can add a post" do
        expect(current_path).to eq posts_path
        expect(page).to have_content "Beautiful Sunset"
        expect(page).to have_content "blah blah blah blah"
        expect(page).to have_css "img[alt='Image']"
      end
    end
    context 'editing' do
      it 'user can edit title and description of own posts' do
        click_link 'Edit post'
        fill_in :Title, with: "New title"
        fill_in :Description, with: "Some stuff"
        click_button 'Update Post'
        expect(page).not_to have_content "Beautiful Sunset"
        expect(page).not_to have_content "blah blah blah blah"
        expect(page).to have_content "New title"
        expect(page).to have_content "Some stuff"
      end
    end

    context 'deleting' do
      it 'user can delete their own posts' do
      end
    end

  end
end
