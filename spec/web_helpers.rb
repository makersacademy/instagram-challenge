def post_pic
  visit "/pics"
  click_link "New Pic"
  fill_in "Title", with: "First pic"
  fill_in "Description", with: "This is the first pic"
  find('form input[name="pic[picture]"]').set('./spec/testpic.jpeg')
  click_button "Create Pic"
end
