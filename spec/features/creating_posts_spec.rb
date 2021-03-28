feature 'creating posts' do
  scenario 'can create a post with an image and caption' do
    sign_up
    click_button('New Post')
    attach_file('image', 'spec/files/images/llama.jpeg')
    fill_in('caption', with: 'Llama')
    click_button('Create Post')
    expect(page).to have_css('img[src*="llama.jpeg"]')
    expect(page).to have_content('Llama')
    expect(current_path).to eq('/posts')
  end

  scenario 'creating a post without an image gives a helpful message' do
    sign_up
    click_button('New Post')
    fill_in('caption', with: 'Forgot the image')
    click_button('Create Post')
    expect(page).to have_content('You forgot to attach an image')
    expect(current_path).to eq('/posts/new')
  end
end
