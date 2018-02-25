def add_pict(title, hints, answer)
  visit '/'
  click_link 'New Pict'
  fill_in :Title, with: title
  fill_in :Hints, with: hints
  fill_in :Answer, with: answer
  attach_file('pict[image]', 'spec/docs/images/code_clue.jpg')
  click_button 'Add Pict'
end
