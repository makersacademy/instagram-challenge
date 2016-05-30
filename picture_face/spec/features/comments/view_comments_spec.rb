feature "Viewing comments" do

  before do
    sign_user_up
    post = create(:post)
  end

  context 'Index page' do
    scenario 'only displays the 3 most recent comments' do
       comment(comment: "Don't show this")
       comment(comment: "or this")
       3.times {comment}
       expect(current_path).to eq '/posts'
       expect(page).not_to have_content "Don't show this"
    end

    scenario 'comments should have the name of the user who created them' do
       comment
       expect(current_path).to eq '/posts'
       expect(page).to have_content "test@example.com"
       expect(page).to have_content "why upload a picture of poo?"
    end
  end

  context 'Show page' do
    scenario 'all comments can be seen on the show page' do
       comment(comment: "show this")
       comment(comment: "and this")
       3.times {comment}
       click_link "A Picture!"
       expect(page).to have_content "show this"
       expect(page).to have_content "and this"
       expect(page).to have_content "why upload a picture of poo?"
    end

    scenario 'comments should have the name of the user who created them' do
       comment
       click_link 'A Picture!'
       expect(page).to have_content "test@example.com"
       expect(page).to have_content "why upload a picture of poo?"
    end
  end

end