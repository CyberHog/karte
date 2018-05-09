class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.practice?
        can :access, :rails_admin
        can :manage, :all
    end
  end
end
