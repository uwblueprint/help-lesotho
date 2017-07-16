class CommentPolicy < ApplicationPolicy
  def owner?
    user.admin? or record.user_id == user.id
  end
end