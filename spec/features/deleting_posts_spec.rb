feature 'editing posts' do
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
end
