feature 'reviewing' do
  before do
    create_post
  end

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Add comment'
     fill_in "Comment", with: "Awesome pic"

     click_button 'Leave comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('Awesome pic')
  end

end
