feature 'viewing' do

  before do
    sign_user_up
  end

  scenario 'user can return to index page' do
    make_post
    click_link 'My First Pic'
    click_button 'Homepage'
    expect(current_path).to eq posts_path
  end

  context 'Can view individual posts' do
    before do
      make_post
    end
    let!(:pic){ Post.find_by(title: 'My First Pic') }
    scenario 'user can view an individual post' do
      click_link 'My First Pic'
      expect(current_path).to eq "/posts/#{pic.id}"
      expect(page).to have_content 'My First Pic'
      expect(page).to have_content 'a random picture'
      expect(page).to have_css("img[src*='poo.jpg']")
    end
  end

  scenario 'Can click an image and view that post' do
    post = create(:post)
    visit '/'
    first(:xpath, '//a[@class="img"]').click
    expect(page.current_path).to eq "/posts/#{post.id}"
  end

end