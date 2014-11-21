class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, 'You must be logged in.' unless user
    @user = user
    @wiki = wiki
  end

  def view_personal?
    update_personal?
  end

  def edit?
    update?
  end

  def index?
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (user.creator?(wiki, user) || user.admin?)
  end

  def update_personal?
    user.present? && user.premium? && (user.creator?(wiki, user) || user.collaborator?(wiki, user))
  end 

  def new_personal?
    create_personal?
  end

  def create_personal?
    user.present? && user.premium?
  end

  def add_collaborators?
    user.present? && user.premium? && user.creator?(record, user)

  def destroy?
    update?
  end

  def scope
    record.class
  end

end
end

