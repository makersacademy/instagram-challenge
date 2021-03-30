feature 'deleting posts' do
  scenario 'posts can be deleted' do
    sign_up
    create_post

    expect(page).to have_css('img[src*="llama.jpeg"]')
    expect(page).to have_content('Llama')
    expect(current_path).to eq('/posts')

    click_link('Delete')
    expect(page).not_to have_content('Llama')
    expect(current_path).to eq('/posts')
  end

  scenario 'only post owner can delete post' do
    create :post, :with_image
    sign_up

    expect(page).to have_css('img[src*="llama.jpeg"]')
    expect(page).to have_content('Llama')
    expect(current_path).to eq('/')

    expect(page).to have_css('img[src*="llama.jpeg"]')
    expect(page).to have_content('Llama')
    expect(page).not_to have_link('Delete')
    expect(page).not_to have_link('Edit')
    expect(current_path).to eq('/')
  end
end
