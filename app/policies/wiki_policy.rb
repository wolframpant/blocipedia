class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:published => true)
      end
  end
end

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def create?
    if wiki.personal
      user.present? && (user.admin? || user.premium?)
    else
      user.present? && (user.admin? || user.standard?)
    end
  end
  
  def update?
    user.present? && (user.admin? || user.creator?(wiki, user) || user.collaborator?(wiki, user))
  end
  
  def destroy?
    user.present? && (user.admin? || user.creator?(wiki, user))
  end
  
  def add_collaborators?
    user.present? && user.creator?(wiki, user)
  end
  
end


