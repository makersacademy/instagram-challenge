module PhotoHelpers
  def upload
    create(:photo, user: User.first)
  end

  def click_first_photo
    within(".photo-grid") do
      first("a").click
    end
  end
end
