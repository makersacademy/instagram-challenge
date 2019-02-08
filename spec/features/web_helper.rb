def pic2
  visit "/pics"
  click_link "POST NEW PIC"
  fill_in "Title", with: "Unbelievable!!"
  fill_in "Description", with: "You never gonna believe it!"
  click_button "Submit"
end
