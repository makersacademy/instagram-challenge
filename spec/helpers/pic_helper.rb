def post_pic
  visit '/posts/new'
  fill_in('Caption', with: 'A lovely cat')
  attach_file('Pic', File.absolute_path("#{ Rails.root }/spec/support/platypus.jpg"))
  click_button('Create Post')
end
