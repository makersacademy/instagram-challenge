describe 'tagging posts' do
  before do
    sign_up
    upload_post
  end

  it 'displayed the tags on the posts page' do
    visit('/')
    click_link('Create a post')
    attach_file("post_image", "spec/sunset.jpg")
    fill_in('Description', with: 'Beautiful view')
    fill_in 'Tags', with: 'beautiful, sunset'
    click_button('Create Post')

    expect(page).to have_link '#beautiful'
    expect(page).to have_link '#sunset'
end
end
