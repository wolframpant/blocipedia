class RelationshipPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  
  def destroy?
    user.present? && (user.admin? || user.creator?(wiki, user))
  end
end