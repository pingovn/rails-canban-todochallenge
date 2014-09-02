class ChallengePolicy < ApplicationPolicy

  #  All user can create Challenge
  def create?
    true
  end

  def update?
    @record.user_id == @user.id
  end

  #  All user can view a challenge
  # TODO: only participants can see a challenge that they participate
  def show?
    true
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
