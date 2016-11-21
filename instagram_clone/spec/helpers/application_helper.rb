module ApplicationHelper

  def post_a_photo
    visit '/photos'
    click_link 'Post a photo'
    fill_in :Location, with: 'Dolores Park'
    attach_file 'Image', "#{Rails.root}/spec/assets/kitten.jpg"
    fill_in :Description, with: 'Such a nice day'
    click_button 'Post'
  end

  def edit_a_photo
    fill_in :Location, with: 'Hawk Hill'
    attach_file 'Image', "#{Rails.root}/spec/assets/tiger.jpg"
    fill_in :Description, with: 'Pretty view'
    click_button 'Update'
  end


end
