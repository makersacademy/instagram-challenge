feature 'liking posts' do
  scenario 'like count increments after clicking like button' do
    create :post, :with_image

    sign_up
    expect(page).to have_content('Llama')
    expect(page).not_to have_selector('.like-count', text: '1')

    click_link('🤍')
    expect(page).to have_selector('.like-count', text: '1')
    expect(page).to have_selector('.like-btn', text: '❤️')
  end
end
