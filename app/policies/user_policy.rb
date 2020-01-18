class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    # record.user == user
    true
  end

  def edit?
    # record.user == user
    true
  end

  def update?
    # record.user == user
    true
  end

  def destroy?
    # record.user == user
    true
  end
end
