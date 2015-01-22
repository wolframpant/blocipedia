class ImagePolicy < ApplicationPolicy
  attr_reader :user, :wiki
  
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def create?
    user.present? && (user.admin? || user.creator?(wiki, user) || user.collaborator?(wiki, user))
  end
  
  def destroy?
    user.present? && (user.admin? || user.creator?(wiki, user))
  end
end

    