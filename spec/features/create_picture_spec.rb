feature 'Picture' do
   it 'can create a picture' do
     visit 'pictures/new'
     attach_file 'picture_image', Rails.root.join('spec/images/test.jpg')
     click_button 'Upload'
     expect(page).to have_css 'img.uploaded-pic'
   end
 end
