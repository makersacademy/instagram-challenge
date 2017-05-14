def add_picture
  visit '/pictures'
  click_link 'Add a picture'
  fill_in 'Status', with: 'nomnom'
  click_button 'Create Picture'
end
