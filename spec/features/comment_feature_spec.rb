describe 'Comments' do
  let!(:test_user) {User.create email: DEFAULT_MAIL, password: DEFAULT_PASSWORD}
  let!(:test_image) {Image.create title: DEFAULT_TITLE, user_id: test_user.id}
  let!(:test_image_2) {Image.create title: DEFAULT_TITLE, user_id: test_user.id}
  let!(:test_comment) {Comment.create text: DEFAULT_COMMENT, user_id: test_user.id, image_id: test_image.id}


  context 'visiting the image page' do

    before :each do
      visit image_path test_image.id
    end

    scenario 'shows the comments on the image' do
      expect(page).to have_content test_comment.text
    end

    scenario 'shows a link to add a comment if comments are present' do
      expect(page).to have_link 'Add a comment!'
    end

    scenario 'shows a link to add a comment if none is present' do
      visit image_path test_image_2.id
      expect(page).to have_link 'Be the first to comment!'
    end

  end

  context 'adding a comment' do

    
  end

end
