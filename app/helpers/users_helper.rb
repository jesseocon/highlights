module UsersHelper
  def allowed?(user_id, owner_id)
    me(user_id, owner_id)
  end
  
  
  def me(user_id, owner_id)
    return true if user_id == owner_id
  end
end
