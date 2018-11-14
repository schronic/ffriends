class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    current_user_or_admin?
  end

  def current_user_or_admin?
    record == user || admin?
  end
end
