describe "#posts/index" do
	 it "Shows all of the posts that are available in timeline after user has signed in" do
 		 sign_up
 		 expect(page).to have_content("Edit profile")
 		 expect(page).to have_content("Logout")
 		 expect(page).to have_content("Logged in as Test")
 	end 
end
