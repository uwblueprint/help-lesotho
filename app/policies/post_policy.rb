class PostPolicy < ApplicationPolicy
  def destroy?
    user.admin? or record.user_id == user.id
  end
end