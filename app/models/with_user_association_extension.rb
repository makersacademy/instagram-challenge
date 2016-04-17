module WithUserAssociationExtension
  def create_with_user(attributes = {}, user)
   attributes[:user] ||= user
   create(attributes)
  end
end
