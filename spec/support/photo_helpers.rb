module PhotoHelpers
  def upload
    create(:photo, user: User.first)
  end
end
