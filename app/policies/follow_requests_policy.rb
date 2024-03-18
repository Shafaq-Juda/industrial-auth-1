class FollowRequestPolicy < ApplicationPolicy

  def show
  end 
  
  def create?
    true
  end

  def update?
    (user == record.sender) || (user == record.recipient) 
  end

  def destroy?
    (user == record.sender) || (user == record.recipient)
  end


end
