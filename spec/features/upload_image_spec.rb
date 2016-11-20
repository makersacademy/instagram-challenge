feature 'Upload an image' do
  scenario 'user uploads an image' do
    visit '/'
    click_link 'Post Image'
    attach_file('picture_image', Rails.root + 'spec/fixtures/duck.jpg')
    fill_in 'picture_comment', :with => 'Me on holiday!'
    expect{click_button 'Post'}.to change{Picture.count}.by(1)
    expect(page).to have_current_path('/')
    expect(page).to have_xpath("//img[contains(@src,'duck.jpg')]")
  end
end
