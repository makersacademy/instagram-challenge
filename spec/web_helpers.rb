def create_picture
  visit '/pictures'
  click_link 'New lint'
  fill_in "picture[url]", with: "https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg"
  click_button 'Save Picture'
end
