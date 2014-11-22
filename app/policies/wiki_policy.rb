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

  def update?
    user.present? && (user.admin? || user.creator?(wiki, user))
  end
end


