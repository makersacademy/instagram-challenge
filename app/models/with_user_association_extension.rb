module WithUserAssociationExtension
  def create_with_user(user)
   attributes[:user] ||= user
   create
  end

  def create_with_user!(user)
    attributes[:user] ||= user
    create!
  end

  def build_with_user(user)
    attributes[:user] ||= user
    build
  end
end