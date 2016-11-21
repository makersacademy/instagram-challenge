feature "user not signed in" do
  scenario "cannot add a gallery" do
      visit "/galleries/new"
      expect {page.driver.submit :post, galleries_path, {"gallery"=>{"name"=>"GB Pictures"}}
    }.not_to change(Gallery, :count)
      expect(page).not_to have_css("form.new_gallery")
      expect(page).to have_css("form.new_user")
  end

  scenario "cannot delete gallery" do
    @user = User.create(email: 'fred@freddy.co.uk', password: "secret",password_confirmation: "secret")
    @gallery = Gallery.create(name: "GB Pictures", user_id: @user.id)
    expect { page.driver.delete "/galleries/#{@gallery.id}" }.not_to change(Gallery, :count)
    end

    # scenario "cannot add a picture" do
    #     sign_up_and_sign_in
    #     create_a_gallery
    #     sign_out
    #     visit "/galleries/"
    #     click_link "GB favourites"
    #     expect {page.driver.submit :post, galleries_path, {"gallery"=>{"name"=>"GB Pictures"}}
    #   }.not_to change(Gallery, :count)
    #     expect(page).not_to have_css("form.new_gallery")
    #     expect(page).to have_css("form.new_user")
    # end

    scenario "cannot delete picture" do
      sign_up_and_sign_in
      @gallery = Gallery.create(name: "GB Pictures")
      @picture = Picture.create(title: "Cute kitten #999", gallery_id: @gallery.id)
      sign_out
      expect { page.driver.delete "/galleries/#{@gallery.id}/pictures/#{@picture.id}" }.not_to change(Picture, :count)
      end

end
