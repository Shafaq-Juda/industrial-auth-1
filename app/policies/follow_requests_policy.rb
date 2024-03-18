class FollowRequestPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user == record.recipient
  end



  def destroy?
    (user == record.sender) || (user == record.recipient)
  end


end
