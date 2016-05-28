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
    end

    context 'adding' do
      it "user can add a post" do
        visit posts_path
        click_link "Add post"
        fill_in :Title, with: "Beautiful Sunset"
        fill_in :Description, with: "blah blah blah blah"
        attach_file :Image, 'public/test/image.jpg'
        click_button 'Create Post'
        expect(current_path).to eq posts_path
        expect(page).to have_content "Beautiful Sunset"
        expect(page).to have_content "blah blah blah blah"
        expect(page).to have_css "img[alt='Image']"
      end
    end
    context 'editing' do
      it 'user can title and description of own posts' do
      
      end
    end

    context 'deleting' do
      it 'user can delete their own posts' do
      end
    end

  end
end
