module AsUserAssociationExtension
  def created_by?(user)
    self.user == user
  end

  def destroy_as_user(user)
    destroy if created_by?(user)
  end

  def update_as_user(attributes = {}, user)
    update(attributes) if created_by?(user)
  end
end
