DEFAULT_TITLE = 'best image on the site'
DEFAULT_TITLE_2 = '2nd best image on the site'

def helper_add_image title: DEFAULT_TITLE
  visit '/images'
  click_link 'Add new image'
  fill_in :image_title, with: title
  click_button 'Upload your image!'
end
