module AsUserAssociationExtension
  def created_by?(user)
      self.user == user
  end

  def destroy_as(user)
    unless created_by? user
      errors.add(:user, 'cannot delete this photo')
    return false
    end
    
    destroy
  end
end