class StopPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    return true
  end
end
