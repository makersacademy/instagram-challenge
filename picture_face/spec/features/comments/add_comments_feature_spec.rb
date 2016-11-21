feature 'Comments' do

  before do
    sign_user_up
    post = create(:post)
  end

  scenario 'allows users to leave a comment' do
     visit '/'
     comment
     expect(current_path).to eq '/posts'
     expect(page).to have_content "why upload a picture of poo?"
  end

end