class TaskPolicy < ApplicationPolicy

  #  All user can create Challenge
  def create?
    challenge.creator_id = @user.id
  end

  def new?
    create?
  end

  # Only can update before challenge started
  def update?
    challenge.starts_on > Date.today
  end

  def destroy?
    update?
  end


  class Scope < Scope
    def resolve
      scope
    end
  end

  private
  def challenge
    @challenge ||= @record.challenge
  end
end
