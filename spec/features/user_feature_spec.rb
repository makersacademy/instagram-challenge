feature "user not signed in" do
  scenario "cannot add a gallery" do
      visit "/galleries/new"
      expect {page.driver.submit :post, galleries_path, {"gallery"=>{"name"=>"GB Pictures"}}
    }.not_to change(Gallery, :count)
      expect(page).not_to have_css("form.new_gallery")
      expect(page).to have_css("form.new_user")
  end

  scenario "cannot delete restaurant" do
    sign_up_and_sign_in
    @gallery = Gallery.create(name: "GB Pictures")
    sign_out
    expect { page.driver.delete "/galleries/#{@gallery.id}" }.not_to change(Gallery, :count)
    end
end
