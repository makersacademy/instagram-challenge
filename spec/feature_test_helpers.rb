def make_a_post
  visit '/posts'
  click_link 'post'
  fill_in 'Caption', with: 'Should I take him to the doctor?'
  page.attach_file "post_image", Rails.root + 'spec/fixtures/test.png'
  click_button 'post it'
end
