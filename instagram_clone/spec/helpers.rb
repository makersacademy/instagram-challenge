require 'fileutils'

def image_upload
	Rails.root + "spec/fixtures/test.png"
end

def remove_uploaded_file
	FileUtils.rm_rf(Rails.root + "public/system")
end

def create_post(image: image_upload, caption: 'The best name ever')
	visit '/posts'
	click_link 'New post'
	attach_file('Image', image)
	fill_in('Caption', with: caption)
	click_button 'Post image'
end

def add_comment(picture_caption: 'The best name ever')
	post = Post.find_by(caption: picture_caption)
	click_link('pic'+post.id.to_s)
	fill_in('Comment', with: 'My comment')
	click_button('Add comment')
end