feature "Viewing comments" do

  before { post = create(:post) }

  scenario 'index page only displays the 3 most recent comments' do
     comment(comment: "Don't show this")
     comment(comment: "or this")
     3.times {comment}
     expect(current_path).to eq '/posts'
     expect(page).not_to have_content "Don't show this"
  end

  scenario 'all comments can be seen on the show page' do
     comment(comment: "show this")
     comment(comment: "and this")
     3.times {comment}
     click_link "A Picture!"
     expect(page).to have_content "show this"
     expect(page).to have_content "and this"
     expect(page).to have_content "why upload a picture of poo?"
  end

end