feature 'User uploads pict' do
scenario 'user uploads an image' do
    create_account
    visit '/pictures/new'
    fill_in 'picture_title', with: 'Kids'
    page.attach_file('picture_image', Rails.root + 'app/assets/images/kids.jpg')
    click_on 'Upload Picture'
    expect(page).to have_content 'Kids'
  end
end
