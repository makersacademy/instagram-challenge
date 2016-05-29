feature 'Index displays a list of posts' do

  before do
    post_one = create(:post)
    post_two = create(:post, caption: "second post")
  end

  scenario 'the index displays correct created job information' do
    visit '/'
    expect(page).to have_content("basic image post")
    expect(page).to have_content("second post")
    expect(page).to have_css("img[src*='poo']")
  end

end