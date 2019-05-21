class ChannelPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user_is_admin?
  end

  def update?
    user_is_owner_or_admin?
  end

  # def destroy?
  #   user_is_owner_or_admin?
  # end

  private

    def user_is_owner_or_admin?
      user.admin || record.user == user
    end

    def user_is_admin?
      user.admin
    end
end
