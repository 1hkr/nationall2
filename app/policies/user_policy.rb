class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    # temporary setting, need security.
    true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end
