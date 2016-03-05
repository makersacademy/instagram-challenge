feature 'Posts' do
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
end
