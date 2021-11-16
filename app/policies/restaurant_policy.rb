class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def update?
    # you can update it if you are the owner
    # record == restaurant
    # user == current user
    record.user == user
  end

  def destroy?
    update?
  end

  def show?
    # everyone can do it
    true
  end

  def create?
    # you can create if you are logged in
    if user.nil?
      false
    else
      true
    end
  end
end
