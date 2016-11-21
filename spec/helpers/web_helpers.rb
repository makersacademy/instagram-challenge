def add_a_pic
  visit '/pics/new'
  fill_in :Description, with: 'awesome picture'
  page.attach_file('pic_url', Rails.root + 'public/test.png')
  click_button 'Create Pic'
end
