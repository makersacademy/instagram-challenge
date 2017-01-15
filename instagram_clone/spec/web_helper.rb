def create_a_photo
  visit '/photos/new'
  fill_in 'title-frm', with: 'testpin'
  fill_in 'description-frm', with: 'describedtest'
  click_button 'form-submit'
end
