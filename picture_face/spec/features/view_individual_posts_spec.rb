feature 'viewing' do
  before do
    make_post
  end
  context 'posts' do
    let!(:pic){ Post.find_by(title: 'My First Pic') }
    scenario 'user can view an individual post' do
      click_link 'My First Pic'
      expect(current_path).to eq "/posts/#{pic.id}"
      expect(page).to have_content 'My First Pic'
      expect(page).to have_content 'a random picture'
      expect(page).to have_css("img[src*='poo.jpg']")
    end
  end

  scenario 'user can return to index page' do
    click_link 'My First Pic'
    click_button 'Homepage'
    expect(current_path).to eq posts_path
  end
end