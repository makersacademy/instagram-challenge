describe "#new" do 
	 it "does not let a user post caption without an image" do
 		 sign_up
 		 click_link "Add a new post"
 		 fill_in "post[caption]", with: "By the beach"
 		 click_on "Create Post"
 		 expect(page).to have_content("Imagecan't be blank")
 	end 

	# it "let's you post an image" do 
	# 	sign_up
	# 	click_link "Add a new post"
	# 	image = fixture_path + "/test_avatar.png"
	# 	file = ActionController::TestUploadedFile.new image, "image/png"	
	# 	fill_in "post[caption]", with: "By the beach"
	# 	click_on "Create Post"
	# 	expect(page).to have_content('Posted by Test')
	# end 
end
