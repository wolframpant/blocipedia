class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def view_personal?
    update_personal?
  end

  def edit?
    update?
  end

  def index?
    false
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
    user.present? && user.creator?(record, user)
  end

  def update_personal?
    user.present? && user.premium? && (user.creator?(record, user) || user.collaborator(record, user))
  end 

  def add_collaborators?
    user.present? && user.premium? && user.creator?(record, user)

  def destroy?
    update?
  end

  def scope
    record.class
  end

# class Scope
  # attr_reader :user, :scope

  # def initialize(user, scope)
  #   @user = user
  #   @scope = scope
  # end

  # def resolve
  #   scope
  # end
end
end

