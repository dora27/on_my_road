class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def profile?
    show?
  end

  def update?
    record == user
  end
end
