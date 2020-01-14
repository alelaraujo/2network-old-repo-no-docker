class TypePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      # record.user == user
      return true
    end

  end
end
