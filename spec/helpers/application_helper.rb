module ApplicationHelper
  def add_post
    visit '/photos'
    click_link 'Show everyone how great your life is'
    fill_in 'Title', with: 'Check out my sepia food'
    page.attach_file('Image', Rails.root + 'public/system/photos/images/Honey_Roast_Ham_1.jpg')
    click_button 'Post photo / fill the yawning void'
  end
end
