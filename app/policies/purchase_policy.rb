class PurchasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    belongs_to_user?
  end

  def update?
    belongs_to_user?
  end

  def destroy?
    belongs_to_user?
  end

  private

  def belongs_to_user?
    record.user == user
  end
end
