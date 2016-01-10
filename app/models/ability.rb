class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # guest user (not logged in)

    if @user.role.blank?
      can :read, :all #for guest without roles
    else
      send @user.role
    end
  end

  def admin
    can :manage, :all
    can :manage, ActiveAdmin::Namespace, name: :admin
  end

end
