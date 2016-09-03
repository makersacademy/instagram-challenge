def add_comment(comment)
  visit "/"
  click_link "Selfie"
  click_link "Add comment"
  fill_in "Comment", with: comment
  click_button "Add comment"
end
