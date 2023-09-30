class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, Category, user_id: user.id
      can :create, Transaction, user_id: user.id
      can :destroy, Transaction do |transaction|
        transaction.user_id == user.id
      end
      can :destroy, Category do |category|
        category.user_id == user.id
      end
    end
  end
end
