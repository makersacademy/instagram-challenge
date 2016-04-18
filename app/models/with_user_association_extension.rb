module WithUserAssociationExtension
  def create_with_user(user, attributes = {})
   attributes[:user] ||= user
   create(attributes)
  end
end
