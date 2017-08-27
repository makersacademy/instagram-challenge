module PhotoHelpers
  def upload
    photo = create(:photo, user: User.first)
    photo.tags << create(:tag)
  end

  def click_first_photo
    within(".photo-grid") do
      first("a").click
    end
  end
end
