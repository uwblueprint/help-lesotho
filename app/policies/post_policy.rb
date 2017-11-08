class PostPolicy < ApplicationPolicy
  def owner?
    user.admin? || (record.user_id == user.id)
  end
end
