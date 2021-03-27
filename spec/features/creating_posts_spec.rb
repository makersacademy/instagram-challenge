feature 'making posts' do
  scenario 'making a post and seeing it in posts page' do
    visit('/')
    click_button('Create post')
    attach_file('Image', 'Spec/public/images/llama.jpeg')
    fill_in('caption').with('Llama')
    click_button('Create post')
    expect(page).to have_css('img[src*="llama.jpeg"]')
    expect(page).to have_content('Llama')
    expect(current_path).to eq('posts/index')
  end
end
