feature 'editing posts' do
  scenario 'posts can be edited' do
    sign_up
    create_post
    expect(page).to have_css('img[src*="llama.jpeg"]')
    expect(page).to have_content('Llama')
    expect(current_path).to eq('/posts')

    click_link('Edit')
    fill_in('caption', with: 'Edited')
    click_button('Save')
    expect(page).not_to have_content('Llama')
    expect(page).to have_content('Edited')
  end
end
