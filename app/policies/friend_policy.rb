class FriendPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(purchase_id: nil)
    end
  end
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    current_user_or_admin?
  end

  def destroy?
    current_user_or_admin?
  end

  private

  def current_user_or_admin?
    record.user == user || user.admin? if user.present?
  end
end
