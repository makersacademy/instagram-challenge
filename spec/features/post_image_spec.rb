feature 'Post an image' do

  scenario 'user uploads an image' do
    visit '/'
    click_link 'Post Image'
    attach_file('picture_image', Rails.root + 'spec/fixtures/duck.jpg')
    fill_in 'picture_comment', :with => 'Me on holiday!'
    expect{click_button 'Post'}.to change{Picture.count}.by(1)
    expect(page).to have_current_path('/')
    expect(page).to have_xpath("//img[contains(@src,'duck.jpg')]")
    expect(page).to have_content('Me on holiday!')
  end

  scenario 'user submits form without an image' do
    visit '/'
    click_link 'Post Image'
    fill_in 'picture_comment', :with => 'Me on holiday!'
    expect{click_button 'Post'}.not_to change{Picture.count}
    expect(page).to have_content 'Image can\'t be blank'
  end

  scenario 'user adds a very long comment' do
    visit '/'
    click_link 'Post Image'
    attach_file('picture_image', Rails.root + 'spec/fixtures/duck.jpg')
    fill_in 'picture_comment', :with => '6fIm6DQuupE7Fh8oYOoPkeFOIJGCMpC1e80RKTG9N5ibTUKMEOe8191FSB4fvtPkVH9HV4P2snkQLtYu6LktNa4wmzbfkmVkRZxTF8q2qK5ttiL8zn1jHmfEJa0QibINlivnYD2ZgAWGP5TI9XIqlqk9nfYTX4MlQfKfOPSiyjGovy1z0YpSrMNRQwLVmJvjgAUlxgnnAI9TsVun4TqeUcuC5W3nKlTpuolXjw3ZCb8CcFoL64juwbzaB1'
    expect{click_button 'Post'}.not_to change{Picture.count}
    expect(page).to have_content 'Comment is too long'
  end

end
