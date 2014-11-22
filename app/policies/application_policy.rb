class ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    raise Pundit::NotAuthorizedError, 'You must be logged in.' unless user
    @user = user
    @wiki = wiki
  end

  def edit?
    update?
  end

  def show?
    scope.where(:id => wiki.id).exists?
  end

  def create?
    user.present?
  end

  def new_personal?
    create_personal?
  end

  def create_personal?
    user.present? && (user.premium? || user.admin?)
  end

  def add_collaborators?
    user.present? && (user.premium? || user.admin?)
  end
  
  def destroy_personal?
    user.present? && user.premium? && (user.creator?(wiki, user) || user.admin?)
  end

  def view_personal?
    update_personal?
  end

  def update_personal?
    user.present? && user.premium? && (user.creator?(wiki, user) || user.collaborator?(wiki, user) || user.admin?)
  end

  def new?
    create?
  end

  def update?
    user.present? && (user.creator?(wiki, user) || user.admin?)
  end

  def destroy?
    update?
  end

end

