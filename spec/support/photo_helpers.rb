module PhotoHelpers
  def upload
    visit "/photos/new"
    fill_in("Description", with: "Emily plays chess!")
    attach_file("Image", Rails.root + "spec/fixtures/chess.JPG")
    click_button("Upload")
  end
end
