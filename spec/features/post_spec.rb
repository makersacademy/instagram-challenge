feature 'Posts' do
  before do
    @user = User.create(email: "test@test.com",
                        username: "test12",
                        password: "1234abcd",
                        password_confirmation: "1234abcd")
    login_as @user
  end

  scenario 'Users can make a post' do
    visit '/'
    click_link 'Make a post'
    fill_in "Title", with: "Hello world!"
    attach_file('post[image]', Rails.root.to_s + '/spec/image/test.jpg')
    click_button "Post"
    within '.posts' do
      expect(page).to have_content('Hello world!')
      expect(page.find('img')['alt']).to have_content 'Test'
    end
  end


  context 'when a user owns post' do
    before do
      @user.posts.create title: "Hello world!"
    end

    scenario 'they can edit posts' do
      visit '/'
      page.find(".show-link").click
      click_link "Edit Your Post"
      fill_in "Title", with: "Goodbye!"
      click_button "Edit"
      expect(page).to have_content "Goodbye"
    end

    scenario 'they can delete posts' do
      visit '/'
      page.find(".show-link").click
      click_link "Delete Your Post"
      within '.posts' do
        expect(page).not_to have_content "Hello world!"
      end
    end
  end

  context 'when a user doesn\'t own posts' do
    before do
      @user2 = User.create(email: "test2@test.com",
                           username: "test13",
                           password: "1234abcd",
                           password_confirmation: "1234abcd")
      @user2.posts.create title: "Good morning!"
    end

    scenario 'they cannot edit the post' do
      visit '/'
      page.find(".show-link").click
      expect(page).not_to have_link("Edit Your Post")
    end

    scenario 'they cannot delete the post' do
      visit '/'
      page.find(".show-link").click
      expect(page).not_to have_link("Delete Your Post")
    end
  end

  scenario 'users can like posts' do
    @user.posts.create(title: "First post")
    visit '/'
    click_button "Like"
    expect(page).to have_content "1 like"
  end
end
